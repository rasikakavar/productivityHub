
angular.module('todoApp', [])
.controller('TodoController', function() {
    var vm = this;

    vm.tasks = [];
    vm.tags = [];
    vm.selectedTag = '';
    vm.editingTask = null;

    // Add a new task
    vm.addTask = function() {
        if (vm.newTask.name && vm.newTask.date) {
            // Check for duplicate task names
            if (vm.tasks.some(task => task.name === vm.newTask.name)) {
                alert('Task with the same name already exists!');
                return;
            }

            vm.tasks.push({
                name: vm.newTask.name,
                date: new Date(vm.newTask.date),
                tag: vm.newTask.tag,
                completed: false
            });

            // Add the tag to the tags list if it doesn't already exist
            if (vm.newTask.tag && vm.tags.indexOf(vm.newTask.tag) === -1) {
                vm.tags.push(vm.newTask.tag);
            }

            // Clear the form
            vm.newTask = {};
        }
    };

    // Delete a task
    vm.deleteTask = function(task) {
        var index = vm.tasks.indexOf(task);
        if (index !== -1) {
            vm.tasks.splice(index, 1);
        }
    };

    // Edit a task
    vm.editTask = function(task) {
        vm.editingTask = angular.copy(task);
    };

    // Save the edited task
    vm.saveTask = function() {
        if (vm.editingTask) {
            var index = vm.tasks.findIndex(task => task.name === vm.editingTask.name);
            if (index !== -1) {
                vm.tasks[index] = vm.editingTask;
            }
            vm.editingTask = null;
        }
    };

    // Cancel editing
    vm.cancelEdit = function() {
        vm.editingTask = null;
    };

    // Mark task as completed
    vm.toggleCompleted = function(task) {
        task.completed = !task.completed;
    };

    // Filter tasks by selected tag
    vm.filterTasksByTag = function(task) {
        return !vm.selectedTag || task.tag === vm.selectedTag;
    };
});