package com.icia.member.service;

import com.icia.member.dto.MemberDTO;
import com.icia.member.dto.MemberFileDTO;
import com.icia.member.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;


    public void save(MemberDTO memberDTO) throws IOException {
        /*
            - 파일 있다.
            1. fileAttached=1, board_table에 저장 후 id값 받아오기
            2. 파일원본 이름 가져오기
            3. 저장용 이름 만들기
            4. 파일 저장용 폴더에 파일 저장 처리
            5. board_file_table에 관련 정보 저장

            - 파일 없다.
                fileAttached=0, 나머지는 기존 방식과 동일
         */
        if(memberDTO.getMemberFile().get(0).isEmpty()){
            //파일 없음
            memberDTO.setMemberProfileAttached(0);
            memberRepository.save(memberDTO);
        }else{
            //파일 있음
            memberDTO.setMemberProfileAttached(1);
            MemberDTO registeredMember = memberRepository.save(memberDTO);
            for(MultipartFile memberFile : memberDTO.getMemberFile()){
                //파일만 따로 가져오기
                //MultipleFile memberFile = memberDTO.getMemberFile();
                //원래 파일 이름 가져오기
                String originalFileName = memberFile.getOriginalFilename();
                System.out.println("originalFileName =" + originalFileName);
                //저장용 파일 이름 만들기
                System.out.println(System.currentTimeMillis());
                String storeFileName = System.currentTimeMillis() + "-" + originalFileName;
                System.out.println("storedFileName = " + storeFileName);
                //memberFileDTO 세팅
                MemberFileDTO memberFileDTO = new MemberFileDTO();
                memberFileDTO.setOriginalFileName(originalFileName);
                memberFileDTO.setStoreFileName(storeFileName);
                memberFileDTO.setMemberId(registeredMember.getId());
                //저장용폴더에 저장
                String savePath = "D:\\save_img\\" + storeFileName;
                memberFile.transferTo(new File(savePath));
                //member_file_tb에 저장처리
                memberRepository.saveFile(memberFileDTO);
            }
        }

    }

    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    public void delete(Long id) {
        memberRepository.delete(id);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return  memberRepository.login(memberDTO);
    }

    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
    }

    public List<MemberFileDTO> findFile(Long id) {
        return memberRepository.findFile(id);
    }

    public void update(MemberDTO memberDTO) {
        memberRepository.update(memberDTO);
    }
}
