var app = angular.module('ShoppingListApp', []);

app.controller('ListsController', function ($scope, listsService) {

    init();
    function init() {

		$scope.lists = listsService.getLists();
		$scope.varHide='';
		$scope.lowerBound = 0;
		$scope.categories = ['food','drinks','clothes','housing','baby','pet','make-up','car','medical','gifts','others'];
		$scope.varHideBtnAdd='';
		$scope.varHideBtnEdit='';
    }

    $scope.greaterThanNum = function(item) {
        return item.id > $scope.lowerBound;
    };
	

    $scope.insertList = function () {
		
        var listName = $scope.newList.listName;
        var describe = $scope.newList.describe;
        listsService.insertList(listName, describe);
        $scope.newList.listName = '';
        $scope.newList.describe = '';
    };

	$scope.insertItem = function(list){
	
		var itemName = list.itemName;
		var quantity = list.quantity;
		var category = list.category;
		
		listsService.insertItem(itemName,quantity,category,list);
		
		list.itemName ='';
		list.quantity ='';
		list.category ='';
		
	};
	$scope.autoComplete = function(product,list){
		
		
		list.itemName = product.itemName;
		list.quantity = product.quantity;
		list.category = product.category;
	}
	$scope.editItem = function(list,id){
		
		var itemName = list.itemName;
		var quantity = list.quantity;
		var category = list.category;

		listsService.editItem(itemName,quantity,category,list,id-1);
		
		list.itemName ='';
		list.quantity ='';
		list.category ='';
	
	};
	
    $scope.deleteList = function (id) {
        listsService.deleteList(id);
    };
	
	$scope.deleteItems = function(list) {
		
		listsService.deleteItems(list);
	};
	
	
});

app.service('listsService', function () {
    this.getLists = function () {
	
		
        return lists; 
    };

    this.insertList = function (listName, describe) {
		
        var topID = lists.length + 1;
        
		lists.push({
            id: topID,
            listName: listName,
            describe: describe,
			orders: [{id:0 }]
			
        });
	
    };
	
	this.insertItem = function (itemName, quantity, category, list){
		
		var topID = list.orders.length+1;
		
		list.orders.push({
			id: topID,
			itemName: itemName,
			quantity: quantity,
			category: category,
			selected: false
		});
				
	};
	
	this.editItem = function(itemName,quantity,category,list,id){
	
		list.orders[id].itemName = itemName;
		list.orders[id].quantity = quantity;
		list.orders[id].category = category;
	
	
	};
	
	
    this.deleteList = function (id) {
        for (var i = lists.length - 1; i >= 0; i--) {
            if (lists[i].id === id) {
                lists.splice(i, 1);
                break;
            }
        }
    };
	
	this.deleteItems = function (list){
		
		for(var i=list.length-1; i >= 0; i--){
			
			if(list[i].selected == true && list[i].id != 0){
				
				list.splice(i,1);
			}
		}
	};

    this.getList = function (id) {
	
		for (var i = 0; i < lists.length; i++) {
            if (lists[i].id === id) {
                return lists[i];
            }
        }
		
        return null;
    };

    var lists = [
        {
            id: 1, listName: 'Georgiana', describe: 'Market',
            orders: [
                { id: 1, itemName: 'Eggs',  quantity: 10,  category: 'food',selected: false },
                { id: 2, itemName: 'Milk',  quantity: 1, category: 'kid',selected: false},
                { id: 3, itemName: 'Carrots',  quantity: 1,  category: 'pet',selected: false},
		{ id: 3, itemName: 'Onion',  quantity: 4,  category: 'food',selected: false},
		{ id: 3, itemName: 'Oranges',  quantity: 5,  category: 'food',selected: false}
            ]
        }

    ];

});
