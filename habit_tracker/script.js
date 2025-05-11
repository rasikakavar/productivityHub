angular.module('habitTrackerApp', []).controller('HabitController', function($scope, $http) {
    $scope.habits = JSON.parse(localStorage.getItem('habits')) || [];
    $scope.selectedHabit = {};
    $scope.newHabit = { name: '', color: '#000000' };

    // Define all 12 months with respective days
    $scope.months = [
        { name: 'January', streak: new Array(31).fill(0).map(() => ({ marked: false })) },
        { name: 'February', streak: new Array(28).fill(0).map(() => ({ marked: false })) },
        { name: 'March', streak: new Array(31).fill(0).map(() => ({ marked: false })) },
        { name: 'April', streak: new Array(30).fill(0).map(() => ({ marked: false })) },
        { name: 'May', streak: new Array(31).fill(0).map(() => ({ marked: false })) },
        { name: 'June', streak: new Array(30).fill(0).map(() => ({ marked: false })) },
        { name: 'July', streak: new Array(31).fill(0).map(() => ({ marked: false })) },
        { name: 'August', streak: new Array(31).fill(0).map(() => ({ marked: false })) },
        { name: 'September', streak: new Array(30).fill(0).map(() => ({ marked: false })) },
        { name: 'October', streak: new Array(31).fill(0).map(() => ({ marked: false })) },
        { name: 'November', streak: new Array(30).fill(0).map(() => ({ marked: false })) },
        { name: 'December', streak: new Array(31).fill(0).map(() => ({ marked: false })) }
    ];

    // Load habits from the database and sync with local storage
    function loadHabits() {
        $http.get('habit.php?action=get_habits').then(function(response) {
            $scope.habits = response.data;
            localStorage.setItem('habits', JSON.stringify($scope.habits)); // Update local storage
        }, function(){
            //if get request fails the local storage will be used.
        });
    }

    loadHabits();

    // Select a habit to track
    $scope.selectHabit = function(habit) {
        $scope.selectedHabit = habit;
    };

    // Toggle tracking for a specific day
    $scope.toggleDay = function(day) {
        day.marked = !day.marked;
        updateHabit($scope.selectedHabit);
        saveHabits();
    };

    // Add a new habit
    $scope.addHabit = function() {
        if ($scope.newHabit.name) {
            let newHabit = {
                name: $scope.newHabit.name,
                color: $scope.newHabit.color,
                streak: angular.copy($scope.months)
            };
            $http.post('habit.php?action=add_habit', newHabit).then(function() {
                loadHabits();
            });
            $scope.habits.push(newHabit);
            $scope.newHabit = { name: '', color: '#000000' };
            saveHabits();
        }
    };

    // Delete a habit
    $scope.deleteHabit = function(index) {
        let habitToDelete = $scope.habits[index];
        $http.post('habit.php?action=delete_habit', { id: habitToDelete.id }).then(function() {
            loadHabits();
        });
        $scope.habits.splice(index, 1);
        if ($scope.selectedHabit.id === habitToDelete.id) {
            $scope.selectedHabit = {};
        }
        saveHabits();
    };

    // Update habit in the database
    function updateHabit(habit) {
        $http.post('habit.php?action=update_habit', habit).then(function() {
            loadHabits();
        });
    }

    // Save to localStorage
    function saveHabits() {
        localStorage.setItem('habits', JSON.stringify($scope.habits));
    }
});