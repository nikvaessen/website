build: clean && build_blog
    mkdir -p docs/
    cp template/main.css docs/

    just _to_html content/about.md docs/index.html
    just _to_html content/publications.md docs/publications.html
    just _to_html content/resume.md docs/resume.html
    just _to_html content/software.md docs/software.html

clean:
    rm -rf docs/*

build_blog:
    echo "<p>There will be blog posts here at some point." | ./template.py template/main.html > docs/blog.html

_to_html markdown html:
    pandoc {{markdown}} --to html | ./template.py template/main.html > {{html}}
