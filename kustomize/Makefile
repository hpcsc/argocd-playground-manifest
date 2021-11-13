KUSTOMIZE_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

##@ kubernetes manifests - kustomize version
.PHONY: kustomize-render-staging kustomize-render-prod kustomize-deploy-staging kustomize-deploy-prod

set-image-tag: ## Set kustomize image tag
	pushd ${KUSTOMIZE_DIR}/base && kustomize edit set image argocd-playground-app=ghcr.io/hpcsc/argocd-playground-app:$(TAG)

kustomize-render-staging: ## Build kustomize for staging environment
	kustomize build ${KUSTOMIZE_DIR}/overlays/staging

kustomize-deploy-staging: ## Build kustomize manifests and apply them in staging environment
	kustomize build ${KUSTOMIZE_DIR}/overlays/staging | kubectl apply -f -

kustomize-render-prod: ## Build kustomize for production environment
	kustomize build ${KUSTOMIZE_DIR}/overlays/prod

kustomize-deploy-prod: ## Build kustomize manifests and apply them in production environment
	kustomize build ${KUSTOMIZE_DIR}/overlays/prod | kubectl apply -f -
