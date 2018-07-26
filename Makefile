figure1.png: figure1-julia.jl
	julia -e 'include("figure1-julia.jl")'


.PHONY: clean

clean:
	rm figure1.png
