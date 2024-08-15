describe("Product Details", () => {
  // Setup: Visit the home page before each test
  beforeEach(() => {
    cy.visit("/");
  });

  it("Navigates to a product detail page from the home page", () => {
    // Click on the first product's link
    cy.get(".products article a").first().click();

    // Ensure that the new page is a product detail page
    cy.url().should("include", "/products/");
    cy.get(".product-detail").should("be.visible");
  });
});
