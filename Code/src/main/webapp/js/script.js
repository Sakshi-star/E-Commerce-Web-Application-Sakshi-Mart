function add_to_cart(pid, pname, price) {
    let cart = localStorage.getItem("cart");
    
    if (cart == null) {
        // No cart yet
        let products = [];
        let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("Product is added for the first time");
    } else {
        // Cart is already present
        let pcart = JSON.parse(cart);
        let oldproduct = pcart.find((item) => item.productId == pid);
        
        if (oldproduct) {
            // We have to increase the quantity
            oldproduct.productQuantity = oldproduct.productQuantity + 1;
            pcart.map((item) => {
       if(item.productId == oldproduct.productId)
       {
           item.productQuantity = oldproduct.productQuantity;
       }
   });
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product quantity is increased");
        } else {
            // We have to add the product (new item)
            let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product is added");
        }
    }
}