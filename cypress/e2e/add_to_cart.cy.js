describe("Add to Cart", () => {
  // Setup: Visit the home page
  beforeEach(() => {
    cy.visit("/");
  });

  it("Adds a product to the cart and increases the cart count", () => {
    // Check initial cart count (should be 0)
    cy.get(".nav-link").contains("My Cart (0)").should("be.visible");

    // Click on the first product's 'Add to Cart' button
    cy.get(".products article").first().find("button").contains("Add").click();

    // Check that the cart count has increased by 1
    cy.get(".nav-link").contains("My Cart (1)").should("be.visible");
  });
});
