const fetch = require("node-fetch");

console.log("hello world");
fetch('https://dummyjson.com/products')
.then(res => res.json())
.then(console.log);