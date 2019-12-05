# dockerjsnapy

Jsnapy bundled into a Docker image for ease of use with some test cases included.

## Installation

- `git clone git@github.com:wirescrossed/dockerjsnapy.git`
- Install Docker Desktop on your workstation. [docker.com](https://www.docker.com)
- Docker image is already built and should download automatically from Docker Hub wirescrossed/jsnapy:latest

## Usage

### Before Change Event

Include the hosts you will be working on in the test/config.yml file.

```yaml
hosts:
  - device: 10.1.1.1
    username : admin
  - device: 10.1.1.2
    username : admin
```

Take a snapshot of the Juniper network devices pre event state `./jsnapy.sh --snap pre -f config.yml`

### After Change Event

Take a snapshop of the Juniper network devices post event state `./jsnapy.sh --snap post -f config.yml`

## Validation Output

### Example Successful Test

```bash
**************************** Device: 10.1.1.1 ****************************
Tests Included: test_bgp_peers
************************* Command: show bgp summary *************************
PASS | All "peer-state" is same in pre and post snapshot [ 6 matched ]
**************************** Device: 10.1.1.1 ****************************
Tests Included: test_isis_peers
************************ Command: show isis adjacency ************************
PASS | All "adjacency-state" is same in pre and post snapshot [ 2 matched ]
**************************** Device: 10.1.1.1 ****************************
Tests Included: test_interfaces
************************** Command: show interfaces **************************
PASS | All "./oper-status" is same in pre and post snapshot [ 44 matched ]
------------------------------- Final Result!! -------------------------------
test_bgp_peers : Passed
test_isis_peers : Passed
test_interfaces : Passed
Total No of tests passed: 3
Total No of tests failed: 0
Overall Tests passed!!!
```

### Example Failed Test

```bash
**************************** Device: 10.1.1.1 ****************************
Tests Included: test_bgp_peers
************************* Command: show bgp summary *************************
PASS | All "peer-state" is same in pre and post snapshot [ 6 matched ]
**************************** Device: 10.1.1.1 ****************************
Tests Included: test_isis_peers
************************ Command: show isis adjacency ************************
Test Failed!! peer state for ['ge-1/1/0.0'] got changed, before it was <['Up']>, now it is <['Down']>
FAIL | All "adjacency-state" is not same in pre and post snapshot [ 1 matched / 1 failed ]
**************************** Device: 10.1.1.1 ****************************
Tests Included: test_interfaces
************************** Command: show interfaces **************************
PASS | All "./oper-status" is same in pre and post snapshot [ 44 matched ]
------------------------------- Final Result!! -------------------------------
test_bgp_peers : Passed
test_isis_peers : Failed
test_interfaces : Passed
Total No of tests passed: 2
Total No of tests failed: 1
Overall Tests failed!!!
```
