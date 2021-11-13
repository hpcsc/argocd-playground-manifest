HELM_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

##@ kubernetes manifests - helm version
.PHONY: helm-render-staging helm-render-prod helm-deploy-staging helm-deploy-prod require-tag

helm-render-staging:	## Render helm chart locally using staging values.yaml
	pushd ${HELM_DIR} && helm template test-release -f ./values.staging.yaml ./chart

helm-deploy-staging: require-tag ## Install helm chart using staging values.yaml
	pushd ${HELM_DIR} && \
		helm upgrade --install \
					 -f ./values.staging.yaml \
					 --set-string image.tag=${TAG} \
					 --wait \
					 -n test \
					 argocd-playground-app \
					 ./chart

helm-render-prod:	## Render helm chart locally using production values.yaml
	pushd ${HELM_DIR} && helm template test-release -f ./values.prod.yaml ./chart

helm-deploy-prod: require-tag ## Install helm chart using production values.yaml
	pushd ${HELM_DIR} && \
		helm upgrade --install \
					 -f ./values.prod.yaml \
					 --set-string image.tag=${TAG} \
					 --wait \
					 -n test \
					 argocd-playground-app \
					 ./chart


require-tag:
ifndef TAG
	$(error TAG variable is required)
endif
