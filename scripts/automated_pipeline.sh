#!/usr/bin/env bash
if [ "$TRAVIS_BRANCH" == "master" ]
  then
    # Create Release - Continuous Delivery
    echo "#### Cloud Foundry ####"
    git config --local user.name ${GITHUB_USERNAME}
    git config --local user.email ${GITHUB_PASSWORD}
    git tag "$(date +'%Y%m%d%H%M%S')-$(git log --format=%h -1)"
    git push --tags

    # Build
    echo "#### Creating container image ####"
    GIT_REV=$(git log -n 1 --pretty=format:%h -- .)
    docker build -t ${GIT_REV} .
    docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}
    docker push brunousml/startdevopsexample:${GIT_REV}

    # Continuous Deployment
    echo "#### Pushing to production ####"
    bx api https://api.ng.bluemix.net
    bx login -o TheForce -s test --apikey 1DU0i1dHCFMItEB_njkM19uyRbCQ8NkPx6NkPh1ZraPA
    bx app push startDevOpsExample --no-start
    bx app start startDevOpsExample
fi