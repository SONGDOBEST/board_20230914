package com.icia.member.repository;

import com.icia.member.dto.MemberDTO;
import com.icia.member.dto.MemberFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;


    public MemberDTO save(MemberDTO memberDTO) {
        sql.insert("Member.save", memberDTO);
        return memberDTO;
    }
    public void saveFile(MemberFileDTO memberFileDTO){
        sql.insert("Member.saveFile", memberFileDTO);
    }
}
