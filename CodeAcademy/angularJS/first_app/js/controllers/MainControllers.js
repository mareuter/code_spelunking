app.controller('MainController', ['$scope', function($scope) { 
   $scope.title = 'Top Sellers in Books';
   $scope.promo = 'Great Deals!';
   $scope.products = [
     {
       name: 'The Book of Trees',
       price: 19,
       pubdate: new Date('2014', '03', '08'),
       cover: 'img/the-book-of-trees.jpg',
       likes: 0,
       dislikes: 0
     },
     {
       name: 'Program or be Programmed',
       price: 8,
       pubdate: new Date('2013', '08', '01'),
       cover: 'img/program-or-be-programmed.jpg',
       likes: 0,
       dislikes: 0
     },
     {
       name: 'Design Patterns',
       price: 54.99,
       pubdate: new Date('2002', '10', '01'),
       likes: 0,
       dislikes: 0
     },
     {
       name: 'Linux Shell Scripting with Bash',
       price: 34.99,
       pubdate: new Date('2004', '02', '01'),
       likes: 0,
       dislikes: 0
     }
   ];
  $scope.plusOne = function(index) {
    $scope.products[index].likes += 1;
  };
  $scope.minusOne = function(index) {
    $scope.products[index].dislikes += 1;
  };
}]);