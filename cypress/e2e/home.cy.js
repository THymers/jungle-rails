describe("Home Page", () => {
  // Test to visit the home page
  it("visits the home page", () => {
    cy.visit("/");
  });

  // Test to check if there are products on the page
  it("There are products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("be.visible");
  });

  // Test to check if there are exactly 2 products on the page
  it("There are 2 products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("have.length", 2);
  });
});
