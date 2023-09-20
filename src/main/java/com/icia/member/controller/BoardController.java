package com.icia.member.controller;

import com.icia.member.dto.BoardDTO;
import com.icia.member.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;

    @GetMapping("")
    public String boardMain(){
        return "boardPages/boardMain";
    }
    @GetMapping("/save")
    public String boardSaveForm(){
        return "boardPages/boardSave";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException{
        boardService.save(boardDTO);
        return "redirect:/board/list";
    }
}
