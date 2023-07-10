terrascan:
	@ls */*.Dockerfile | while read f ; \
	do \
		echo "==== $$f ====" ; \
		terrascan scan -v --show-passed -d $$(dirname $$f) -i docker --severity high \
		|| exit $$? ; \
	done > drivers-terrascan-result.txt

clean-terrascan:
	rm -rf drivers-terrascan-result.txt