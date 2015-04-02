default['consul_template']['config'] = {
  auth: {
    enabled: false,
    username: '',
    password: ''
  }, 
  consul: '127.0.0.1:8500',
  'max_stale': 0,
  'ssl': {
    'enabled': false,
    'verify': true
  },
  'syslog': {
    'enabled': false,
    'facility': 'LOCAL0'
  },
  'token': '',
  'wait': '',
  'retry': '5s'
}
