## Assignment 1

Motivation:
We want to create a virtual e-commerce store that is composed of products. In following issues, we'll build up a project that can do some basic functions of an online e-commerce store.
Spec: Write simple program with ability to represent product.
- Create a product component that can represent a simple product with Name and Price
- Enhance the component with ability to print out the name and price of the product

## Assignment 2

Motivation: 
Now as we have an ability to represent a product in our e-commerce app we want to do some interesting basic operations with the products.

Spec: Build up basic e-commerce calculations

- Add ability to compute price sum of products
- Add ability to print out the price sum of the products
- Add ability to compute the cheapest product and the most expensive product
- Add ability to print out the cheapest product and the most expensive product

## Assignment 3

Motivation:
We have simple calculations as 'sum', 'cheapest_product', 'most_expensive_product' now we want to level this up a bit and introduce real-world complexity such as VAT.

Spec: Allow product to have specified VAT

- Add to our product component ability to hold VAT
- Add ability to print out price with VAT
- Add ability to calculate sum with and without VAT (think about 'cheapest' and 'most_expensive' also)

## Assignment 4

Motivation:
We want to add a bit more real-world complexity such as an ability to create more complex products that can contain other products.

Spec: Product can contain other products

- Add ability for product to contain sub-products
- Modify all already existing functionalities to cope with this complexity
- Create possibility to print out the tree of products, with selected product and it's sub-products. The print out should be nicely display tree structure of the products.
