FROM cloudbees/jnlp-slave-with-java-build-tools:latest
USER root
#==================== install latest sfdx from npm ===================#
RUN npm install sfdx-cli --global
RUN sfdx --version
RUN which sfdx
RUN sfdx plugins --core
RUN sfdx update

COPY docker-entrypoint.sh .
RUN chmod 755 docker-entrypoint.sh

# Run the entrypoint script on startup
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD sfdx help
#==================== Salesforce Ant Migration tool ===================#
ENV ANT_VERSION 1.10.5
ENV ANT_HOME /opt/ant

# Salesforce Ant migration tool
ENV SF_ANT_VERSION 45.0

# Apache Ant installation
RUN cd /tmp \
    && wget http://www.us.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz \
    && mkdir ant-${ANT_VERSION} \
    && tar -zxvf apache-ant-${ANT_VERSION}-bin.tar.gz \
    && mv apache-ant-${ANT_VERSION} ${ANT_HOME} \
    && rm apache-ant-${ANT_VERSION}-bin.tar.gz \
    && rm -rf ant-${ANT_VERSION} \
    && rm -rf ${ANT_HOME}/manual \
    && unset ANT_VERSION
ENV PATH ${ANT_HOME}/bin:${PATH}

# Salesforce Ant migration tool installation
RUN cd /tmp \
    && mkdir salesforce-ant-${SF_ANT_VERSION} \
    && wget https://gs0.salesforce.com/dwnld/SfdcAnt/salesforce_ant_${SF_ANT_VERSION}.zip \
    && unzip -d salesforce-ant-${SF_ANT_VERSION} salesforce_ant_${SF_ANT_VERSION}.zip \
    && mv salesforce-ant-${SF_ANT_VERSION}/ant-salesforce.jar ${ANT_HOME}/lib \
    && rm salesforce_ant_${SF_ANT_VERSION}.zip \
    && rm -rf salesforce-ant-${SF_ANT_VERSION} \
    && unset SF_ANT_VERSION
#==================== Heroku Cli ====================================#
RUN curl https://cli-assets.heroku.com/install.sh | sh
USER jenkins
