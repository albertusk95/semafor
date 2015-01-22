#!/bin/bash

set -e # fail fast

echo
echo "step 4ii: Caching Feature Vectors"
echo

source "$(dirname ${BASH_SOURCE[0]})/config.sh"

${JAVA_HOME_BIN}/java -classpath ${classpath} -Xms4g -Xmx4g \
  edu.cmu.cs.lti.ark.fn.parsing.FrameFeaturesCache \
  eventsfile:${SCAN_DIR}/cv.train.events.bin \
  spansfile:${SCAN_DIR}/cv.train.sentences.frame.elements.spans \
  train-framefile:${fe_file} \
  localfeaturescache:${SCAN_DIR}/featurecache.jobj
