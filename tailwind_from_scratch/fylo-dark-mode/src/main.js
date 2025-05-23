import "./style.css";

function setTheme(theme) {
  document.documentElement.classList.remove("light", "dark");
  document.documentElement.classList.add(theme);
}

// Get stored or system theme.
// Default: dark theme + save it.
let initialTheme = localStorage.getItem("theme");
if (!initialTheme) {
  initialTheme = window.matchMedia("(prefers-color-scheme: light)").matches
    ? "light"
    : "dark";
  localStorage.setItem("theme", initialTheme);
}

// Set initial theme.
setTheme(initialTheme);

// Add event listener to theme toggling button.
const toggleButton = document.getElementById("light-switch");
toggleButton.addEventListener("click", () => {
  // Calculate new theme.
  const currentTheme = localStorage.getItem("theme") || "dark";
  const newTheme = currentTheme === "dark" ? "light" : "dark";

  // Remove old theme, apply the new one.
  setTheme(newTheme);

  // Set the new theme in localStorage.
  localStorage.setItem("theme", newTheme);
});

// Enable smooth scroll to features and testimonials sections.
const gotoFeaturesBtn = document.getElementById("btn-goto-features");
const gotoTestimonialsBtn = document.getElementById("btn-goto-testimonials");

function scrollToSection(sectionId) {
  document.getElementById(sectionId).scrollIntoView({
    behavior: "smooth",
  });
}

gotoFeaturesBtn.addEventListener("click", () =>
  scrollToSection("features-section")
);
gotoTestimonialsBtn.addEventListener("click", () =>
  scrollToSection("testimonials-section")
);
