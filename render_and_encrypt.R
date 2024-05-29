# Load necessary libraries
# library(remotes)
# remotes::install_github("dirkschumacher/encryptedRmd")
library(rmarkdown)
library(encryptedRmd)
library(digest)

# Define file names
input_Rmd <- "index.Rmd"
rendered_html <- "index_unencrypted.html"
encrypted_html <- "docs/index.html"

# Retrieve password from environment variable
pw <- Sys.getenv("pw_html_encrypt")
pw_32 <- digest::digest(pw, algo = "sha256", serialize = FALSE, raw = TRUE)

# Render the RMarkdown file to HTML
rmarkdown::render(input_Rmd, output_file = rendered_html)

# Encrypt the HTML file
encryptedRmd::encrypt_html_file(path = rendered_html, output_path = encrypted_html, key = pw_32)

