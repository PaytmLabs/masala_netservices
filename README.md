# masala_netservices

This is a component of the [masala toolkit](https://github.com/PaytmLabs/masala).

This is a composite [wrapper cookbook](http://blog.vialstudios.com/the-environment-cookbook-pattern/#thewrappercookbook). It brings together a number of necessary supporting services, and a way to virtualize redundant instances for high availability.  All of these services have the quality that even where a "master" role exists, and services can run with minor impact via the "auxilary" roles if that primary source is missing for a time.

Currently this includes LDAP master/replicas and NTP server pools.

Possible future additions:

- internal SMTP relaying. Exit role may be left external to this with the focus only on getting to that exit.
- internal name services (DNS, possibly via consul)

It will enable datadog monitoring for ntp if enabled in masala_base, as it is the only function directly enabled by this cookbook. The relevant cookbooks used for the composite service are expected to enable monitoring if supported.

In the implementation, a simple "primary" and "auxiliary" role will be implemented.
For LDAP and DNS, this will map to "master" and "replica", for NTP, it will not be any different
And for SMTP, it will be an "upper" and "lower" tier of relay.

## Supported Platforms

The platforms supported are:
- Centos 6.7+ / Centos 7.1+
- Ubuntu 14.04 LTS (And future LTS releases)
- Debioan 8.2+

## Attributes

Please see the documentation for the cookbooks included by masala_haproxy. (See [metadata.rb](https://github.com/PaytmLabs/masala_netservices/blob/develop/metadata.rb) file)

All of these values pass through to keepalived and only apply to the master and backup recipes, which include the keepalived support. To skip keepalived, just use the default recipe.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['masala_netservices']['cluster_name']</tt></td>
    <td>String</td>
    <td>Name of a particular "cluster" of netservices.</td>
    <td><tt>no_name</tt></td>
  </tr>
  <tr>
    <td><tt>['masala_netservices']['vip_mode']</tt></td>
    <td>String</td>
    <td>Type of keepalive to add to the node. Valid options are: none, master, backup</td>
    <td><tt>none</tt></td>
  </tr>
  <tr>
    <td><tt>['masala_haproxy']['keepalive_password']</tt></td>
    <td>String</td>
    <td>password for securing keepalive co-ordination</td>
    <td><tt>abc123</tt></td>
  </tr>
  <tr>
    <td><tt>['masala_haproxy']['keepalive_vi_1']</tt></td>
    <td>Hash</td>
    <td>keepalived virtual interface definition - primary.</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['masala_haproxy']['keepalive_vi_2']</tt></td>
    <td>Hash</td>
    <td>keepalived virtual interface definition - secondary.</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

## Usage

### masala_netservices::default

Include `masala_netservices` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[masala_netservices::default]"
  ]
}
```

## License, authors, and how to contribute

See:
- [LICENSE](https://github.com/PaytmLabs/masala_netservices/blob/develop/LICENSE)
- [MAINTAINERS.md](https://github.com/PaytmLabs/masala_netservices/blob/develop/MAINTAINERS.md)
- [CONTRIBUTING.md](https://github.com/PaytmLabs/masala_netservices/blob/develop/CONTRIBUTING.md)

