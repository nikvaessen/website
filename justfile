_default:
    just --list

_to_html markdown html:
    pandoc {{markdown}} --to html | ./template.py template/main.html > {{html}}

clean:
    rm -rf build/*

build: clean && build_blog
    mkdir -p build
    cp template/main.css build/

    just _to_html content/about.md build/index.html
    just _to_html content/publications.md build/publications.html
    just _to_html content/resume.md build/resume.html
    just _to_html content/software.md build/software.html

build_blog:
    echo "<p>There will be blog posts here at some point." | ./template.py template/main.html > build/blog.html