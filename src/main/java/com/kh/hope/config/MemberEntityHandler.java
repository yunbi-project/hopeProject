package com.kh.hope.config;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import com.kh.hope.member.model.vo.MemberEntity;


/** 
 * MemberEntityHandler 클래스는 MyBatis에서 MemberEntity 객체를 데이터베이스와 매핑하는데 사용된다.
 * 
 * BaseTyHandler를 상속하여 MemberEntity 객체를 데이터베이스에 저장하거나 결과를 읽을 수 있도록 지원한다.
 * 
 * */
public class MemberEntityHandler extends BaseTypeHandler<MemberEntity> {

	//  이 메서드는 PreparedStatement에 MemberEntity 객체의 속성을 설정하는 데 사용된다.
    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, MemberEntity memberEntity, JdbcType jdbcType) throws SQLException {
        preparedStatement.setString(i, memberEntity.getUserName());
        preparedStatement.setString(i + 1, memberEntity.getEmail());
        preparedStatement.setString(i + 2, memberEntity.getRole());
    }

    // 이 메서드는 ResultSet이나 CallableStatement에서 MemberEntity 객체를 가져오는 데 사용된다
    @Override
    public MemberEntity getNullableResult(ResultSet resultSet, String s) throws SQLException {
        MemberEntity memberEntity = new MemberEntity();
        memberEntity.setId(resultSet.getLong("id"));
        memberEntity.setUserName(resultSet.getString("userName"));
        memberEntity.setEmail(resultSet.getString("email"));
        memberEntity.setRole(resultSet.getString("role"));
        return memberEntity;
    }

    @Override
    public MemberEntity getNullableResult(ResultSet resultSet, int i) throws SQLException {
        MemberEntity memberEntity = new MemberEntity();
        memberEntity.setId(resultSet.getLong("id"));
        memberEntity.setUserName(resultSet.getString("userName"));
        memberEntity.setEmail(resultSet.getString("email"));
        memberEntity.setRole(resultSet.getString("role"));
        return memberEntity;
    }

    @Override
    public MemberEntity getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        MemberEntity memberEntity = new MemberEntity();
        memberEntity.setId(callableStatement.getLong("id"));
        memberEntity.setUserName(callableStatement.getString("userName"));
        memberEntity.setEmail(callableStatement.getString("email"));
        memberEntity.setRole(callableStatement.getString("role"));
        return memberEntity;
    }
}
