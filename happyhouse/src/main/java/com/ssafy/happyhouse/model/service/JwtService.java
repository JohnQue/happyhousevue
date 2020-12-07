package com.ssafy.happyhouse.model.service;

import java.util.Date;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.MemberDto;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Service
public class JwtService {

	private String signature = "VUETOKEN";
	private long expireMin = 30L;

	public String create(MemberDto memberDto) {
		JwtBuilder jwtBuilder = Jwts.builder();

		jwtBuilder.setHeaderParam("typ", "JWT");
		jwtBuilder.setSubject("로그인토큰").setExpiration(new Date(System.currentTimeMillis() + 1000 * 60 * expireMin))
				.claim("user", memberDto).claim("greeting", "환영합니다. " + memberDto.getName());

		jwtBuilder.signWith(SignatureAlgorithm.HS256, signature.getBytes());
		String jwt = jwtBuilder.compact();
		return jwt;
	}

	public void checkValid(String jwt) {
		Jwts.parser().setSigningKey(signature.getBytes()).parseClaimsJws(jwt);
	}

	//JWT Token을 분석해서 필요한 정보를 반환.
	public Map<String, Object> get(String jwt) {
		Jws<Claims> claims = null;
		try {
			claims = Jwts.parser().setSigningKey(signature.getBytes()).parseClaimsJws(jwt);
		} catch (final Exception e) {
			throw new RuntimeException();
		}

		// Claims는 Map의 구현체이다.
		return claims.getBody();
	}
}
