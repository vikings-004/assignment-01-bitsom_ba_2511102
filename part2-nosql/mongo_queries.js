// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
    {
        product_id: 1,
        name: "iPhone 15",
        category: "Electronics",
        price: 80000,
        specs: {
            warranty: "1 year",
            voltage: "220V",
            brand: "Apple"
        }
    },
    {
        product_id: 2,
        name: "Men's T-Shirt",
        category: "Clothing",
        price: 999,
        sizes: ["S", "M", "L", "XL"],
        material: "Cotton",
        brand: "Nike"
    },
    {
        product_id: 3,
        name: "Milk",
        category: "Groceries",
        price: 60,
        expiry_date: "2024-12-01",
        nutrition: {
            fat: "3%",
            protein: "3g",
            calories: "150 kcal"
        }
    }
]);


// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
    category: "Electronics",
    price: { $gt: 20000 }
});


// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
    category: "Groceries",
    expiry_date: { $lt: "2025-01-01" }
});


// OP4: updateOne() — add a "discount_percent" field
db.products.updateOne(
    { name: "iPhone 15" },
    { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create index on category
db.products.createIndex({ category: 1 });

// Index improves query performance when filtering by category