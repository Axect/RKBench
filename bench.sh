#!/usr/bin/sh
bench() {
    hyperfine -w 3 --export-markdown data/bench.md --export-csv data/bench.csv \
        "./rust/target/release/rust" \
        "./oxide/target/release/oxide" \
        "./chapel/target/release/chapel" \
        "python python/python.py" \
        "Rscript r/R.r" \
        "julia julia/julia.jl"
}

bench
