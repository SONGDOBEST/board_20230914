package com.icia.member.controller;

import com.icia.member.dto.MemberDTO;
import com.icia.member.dto.MemberFileDTO;
import com.icia.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String saveForm(){
        return "memberPages/memberSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        memberService.save(memberDTO);
        return "redirect:/";
    }
    @GetMapping("/list")
    public String findAll(Model model){
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "memberPages/memberList";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id){
        memberService.delete(id);
        return "redirect:/member/list";
    }
    @GetMapping("/login")
    public String loginForm(){
        return "memberPages/memberLogin";
    }
    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session){
        MemberDTO result = memberService.login(memberDTO);
        if(result != null){
            //session에 저장
            session.setAttribute("loginMember", result);
            return "memberPages/memberMain";
        }else{
            return "memberPages/memberLogin";
        }
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){
        //해당 파라미터만 없앨경우
        session.removeAttribute("loginMember");
        return "redirect:/";
    }
    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        if(memberDTO.getMemberProfileAttached() == 1){
            List<MemberFileDTO> memberFileDTOList = memberService.findFile(id);
            model.addAttribute("memberFileList", memberFileDTOList);
        }
        return "memberPages/memberDetail";
    }
    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        if(memberDTO.getMemberProfileAttached()==1){
            List<MemberFileDTO> memberFileDTOList = memberService.findFile(id);
            model.addAttribute("memberFileList", memberFileDTOList);
        }
        return "memberpages/memberUpdate";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO, Model model){
        memberService.update(memberDTO);
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "memberpages/memberDetail";
    }


}
