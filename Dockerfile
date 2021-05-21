FROM registry.access.redhat.com/ubi8/ubi:latest

LABEL maintainer="chrilee@redhat.com"

ENV REG_CREDS="pull-secret.json" \
    OCP_TAG="v4.7" \
    OCP_VERSION="4.7.5" \
    REGISTRY="registry.redhat.io/redhat/redhat-operator-index" \
    CATALOG_DIR="/opt/operator-catalog"

RUN mkdir -p ${CATALOG_DIR} && \
    curl -O https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OCP_VERSION}/openshift-client-linux-${OCP_VERSION}.tar.gz && \
    tar -xzvf *.tar.gz && \
    mv oc kubectl /usr/bin

WORKDIR ${CATALOG_DIR}

CMD oc adm catalog mirror \
    ${REGISTRY}:${OCP_TAG} \
    file:///local/index \
    -a ${REG_CREDS} \
    --insecure 
