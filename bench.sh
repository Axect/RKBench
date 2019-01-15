#!/usr/bin/sh
bench() {
    hyperfine -w 3 --export-markdown data/bench.md --export-csv data/bench.csv \
        "./rust/target/release/rust" \
        "./chapel/target/release/chapel" \
        "python python/python.py" \
        "Rscript r/R.r"
}

bench
