// Email Form Validation
document.addEventListener("DOMContentLoaded", () => {
    const emailForm = document.querySelectorAll(".email-signup");
  
    emailForm.forEach(form => {
      form.addEventListener("submit", (e) => {
        e.preventDefault();
        const emailInput = form.querySelector("input[type='email']");
        const email = emailInput.value.trim();
        if (isValidEmail(email)) {
          document.getElementById("sign-up").onclick = function (){
            window.location.href="movies.html";}
          alert("Thank you for signing up!");
          emailInput.value = ""; // Clear input field
        } else {
          alert("Please enter a valid email address.");
        }
      });
    });
  
    function isValidEmail(email) {
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      return emailRegex.test(email);
    }
  
    // FAQ Accordion Functionality
    const faqItems = document.querySelectorAll(".accordian li");
    faqItems.forEach((item) => {
      const input = item.querySelector("input[type='radio']");
      const label = item.querySelector("label");
      label.addEventListener("click", () => {
        if (input.checked) {
          input.checked = false; // Close the item if it's already open
        } else {
          input.checked = true; // Open the item
        }
      });
    });
  
    // Dynamic Footer Loading
    function loadFooter() {
      fetch("footer.html")
        .then((response) => {
          if (!response.ok) {
            throw new Error("Network response was not ok " + response.statusText);
          }
          return response.text();
        })
        .then((html) => {
          const footerContainer = document.createElement("div");
          footerContainer.innerHTML = html;
          document.body.appendChild(footerContainer);
        })
        .catch((error) => console.error("Error loading footer:", error));
    }
  
    loadFooter();
    });


    // Slider
    document.addEventListener("DOMContentLoaded", () => {
        const containerSlider = document.getElementById("containerSlider");
        const slides = containerSlider.querySelectorAll("#slidingImage");
        let currentIndex = 0;
      
        // Initialize slider
        slides.forEach((slide, index) => {
          slide.style.position = "absolute";
          slide.style.opacity = index === 0 ? "1" : "0";
          slide.style.transition = "opacity 1s ease-in-out";
        });
      
        // Function to show the next slide
        function showNextSlide() {
          const nextIndex = (currentIndex + 1) % slides.length;
      
          slides[currentIndex].style.opacity = "0"; // Hide current slide
          slides[nextIndex].style.opacity = "1"; // Show next slide
      
          currentIndex = nextIndex; // Update current index
        }
      
        // Start slider
        setInterval(showNextSlide, 2000); // Change slide every 2 seconds
    });
      

  