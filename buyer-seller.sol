pragma solidity ^0.4.11;

contract BuyerSeller {
    address creator;
    
    struct Product {
        string name;
        uint8 price;
    }
    mapping (uint => Product) productIdMapping;
    mapping (address => uint[]) productListing;
    
    function listProducts(address seller) constant returns (uint[] ids) {
        return productListing[seller];
    }
    function getProductById(uint productId) constant returns(string, uint) {
        return (productIdMapping[productId].name, productIdMapping[productId].price);
    }
    function BuyerSeller() {
        creator = msg.sender;

        productIdMapping[0] = Product({name:"Product1", price:1});
        productIdMapping[1] = Product({name:"Product2", price:2});
        productIdMapping[2] = Product({name:"Product3", price:3});

        productListing[this].push(0);
        productListing[this].push(1);
        productListing[this].push(2);
    }
    function kill() {
        if(msg.sender == creator) {
            selfdestruct(creator);
        }
    }
}
