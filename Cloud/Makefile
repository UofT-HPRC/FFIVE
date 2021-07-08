all: prereqs Dockerfile config.yaml Makefile
	read -p "Enter user name (for example: uofthprc): " name && \
	read -p "Enter image tag (for example: latest): " tag && \
	docker build -t $$name/sdn-controller:$$tag . && \
	docker push $$name/sdn-controller:$$tag && \
	perl -pi -e "s/uofthprc/$$name/gi;" Deploy.yaml && \
	perl -pi -e "s/latest/$$tag/gi;" Deploy.yaml

prereqs: controller.py
	pipreqs . --force
