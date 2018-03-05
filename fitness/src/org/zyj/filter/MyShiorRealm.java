package org.zyj.filter;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by xingmao on 2018/2/28.
 */
public class MyShiorRealm extends AuthorizingRealm {

	private final static String USERNAME = "zhangs";
	private final static String PASSWORD = "111aaa";

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		Set<String> roleNames = new HashSet<String>();
		Set<String> permissions = new HashSet<String>();
		roleNames.add("administrator");
		permissions.add("newPage.jsp");

		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roleNames);
		info.setStringPermissions(permissions);

		return info;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {

		UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
		if (token.getUsername().equals(USERNAME)){
			return new SimpleAuthenticationInfo(USERNAME, PASSWORD, getName());
		} else {
			throw new AuthenticationException();
		}

	}
}
