var app = angular.module('quoteApp', []);
app.controller('QuoteController', function ($scope, $http) {
    $scope.isDarkMode = false;
    $scope.quotes = []; // Start with an empty array, quotes will be fetched dynamically

    // Function to fetch quotes from the PHP file
    $scope.fetchQuotes = function () {
        $http.get('fetch_quote.php')
            .then(function (response) {
                $scope.quotes = response.data; // Assign fetched quotes to $scope.quotes
                $scope.generateQuote(); // Generate the first random quote after fetching
            }, function (error) {
                alert('Error fetching quotes: ' + error.data);
            });
    };

    // Function to generate a random quote from the fetched quotes
    $scope.generateQuote = function () {
        if ($scope.quotes.length > 0) {
            var randomIndex = Math.floor(Math.random() * $scope.quotes.length);
            $scope.randomQuote = $scope.quotes[randomIndex];
            $scope.copied = false;
        } else {
            $scope.randomQuote = null; // No quote available if the list is empty
        }
    };

    // Generate first quote after fetching quotes
    $scope.fetchQuotes();

    // Function to copy quote to clipboard
    $scope.copyQuote = function () {
        var tempInput = document.createElement("textarea");
        tempInput.value = `"${$scope.randomQuote.text}" - ${$scope.randomQuote.author}`;
        document.body.appendChild(tempInput);
        tempInput.select();
        document.execCommand("copy");
        document.body.removeChild(tempInput);
        $scope.copied = true;
    };


    // ✅ Fix for Dark Mode Toggle (Now it Saves Mode in Local Storage)
    $scope.toggleTheme = function () {
        $scope.isDarkMode = !$scope.isDarkMode;
        localStorage.setItem("darkMode", $scope.isDarkMode); // Save mode in localStorage
    };

    // ✅ Check if Dark Mode was enabled before and apply it
    if (localStorage.getItem("darkMode") === "true") {
        $scope.isDarkMode = true;
    }
});
