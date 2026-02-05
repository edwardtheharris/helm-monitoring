###
# ```{rubric} Cluster Role Tests
# ```
# ---
# Test suite for cluster roles.
#
# ```{literalinclude} prometheus/tests/test_clusterrole.yaml
# :language: yaml
# :caption: tessts/test_clusterrole.yaml
# :start-at: "suite: 'ClusterRole test suite'
# ```
suite: "Cluster Role Test Suite"
release:
  name: prometheus
templates:
  - templates/clusterrole.yaml
values:
  - ../values.yaml
tests:
  - it: should match the snapshot
    asserts:
      - matchSnapshot: {}
