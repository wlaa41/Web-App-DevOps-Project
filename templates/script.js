document.addEventListener("DOMContentLoaded", function() {
    const paginationLinks = document.querySelectorAll(".pagination-link");
    const orderTable = document.querySelector(".order-table");

    paginationLinks.forEach(link => {
        link.addEventListener("click", function(event) {
            event.preventDefault();

            const nextPageURL = this.getAttribute("href");

            // Send AJAX request to fetch next page data
            fetch(nextPageURL)
                .then(response => response.text())
                .then(data => {
                    // Update table and pagination controls
                    const newHTML = new DOMParser().parseFromString(data, "text/html");
                    const newTable = newHTML.querySelector(".order-table");
                    const newPagination = newHTML.querySelector(".pagination");

                    orderTable.innerHTML = newTable.innerHTML;
                    const paginationDiv = document.querySelector(".pagination");
                    paginationDiv.innerHTML = newPagination.innerHTML;

                    // Scroll to the top of the table
                    window.scrollTo({ top: orderTable.offsetTop, behavior: "smooth" });
                })
                .catch(error => {
                    console.error("Error fetching data:", error);
                });
        });
    });
});
