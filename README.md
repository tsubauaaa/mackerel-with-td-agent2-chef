mackerel Cookbook
===============
mackerel-agent install

Requirements
------------
platforms:amazon, centos6.5~

Attributes
----------
TODO: List your cookbook attributes here.

#### mackerel::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['mackerel']['packages']</tt></td>
    <td>Array</td>
    <td>mackerel packages</td>
    <td><tt>%w(mackerel-agent mackerel-agent-plugins)</tt></td>
  </tr>
  <tr>
    <td><tt>['mackerel']['apikey']</tt></td>
    <td>String</td>
    <td>Your mackerel API keys</td>
    <td><tt>YOUR_MACKEREL_API_KEY</tt></td>
  </tr>
  <tr>
    <td><tt>['mackerel']['iptables']['config']</tt></td>
    <td>String</td>
    <td>either disabled or enabled iptabls</td>
    <td><tt>disabled</tt></td>
  </tr>
  <tr>
    <td><tt>['mackerel']['iptables']['services']</tt></td>
    <td>Array</td>
    <td>iptables services</td>
    <td><tt>%w({)iptables ip6tables)</tt></td>
  </tr>
  <tr>
    <td><tt>['mackerel']['td_agent2']['gems']</tt></td>
    <td>Array</td>
    <td>td-agent2 gems</td>
    <td><tt>%w(fluent-plugin-datacounter fluent-plugin-mackerel)</tt></td>
  </tr>
  <tr>
    <td><tt>['mackerel']['td_agent2']['endpoint']</tt></td>
    <td>String</td>
    <td>The endpoint of mackerel</td>
    <td><tt>https://mackerel.io</tt></td>
  </tr>
</table>

Usage
-----
#### mackerel::default
Just include `mackerel::default` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[mackerel::default]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Distributed under the [MIT License][mit].
