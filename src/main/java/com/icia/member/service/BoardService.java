package com.icia.member.service;

import com.icia.member.dto.BoardDTO;
import com.icia.member.dto.BoardFileDTO;
import com.icia.member.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;

    public void save(BoardDTO boardDTO) throws IOException {
        if(boardDTO.getBoardFile().get(0).isEmpty()){
            //파일 없음
            boardDTO.setFileAttached(0);
            boardRepository.save(boardDTO);
        }else{
            //파일 있음
            boardDTO.setFileAttached(1);
            //게시글 저장 후 id 활용하기 위해 리턴받음.
            BoardDTO boardDTO1 = boardRepository.save(boardDTO);
            //MultipartFile로 받았으므로, 파일이 여러개일 수도 있음. for문을 이용해 하나씩 꺼내서 저장처리
            for(MultipartFile boardFile : boardDTO.getBoardFile()){
                //파일 이름
                String originalFileName = boardFile.getOriginalFilename();
                //저장용 이름
                String storeFileName = System.currentTimeMillis() + "-" +originalFileName;
                //boardDTO 세팅
                BoardFileDTO boardFileDTO = new BoardFileDTO();
                boardFileDTO.setOriginalFileName(originalFileName);
                boardFileDTO.setStoreFileName(storeFileName);
                boardFileDTO.setBoardId(boardDTO1.getId());
                //파일 저장용 폴더에 저장하기
                String savePath = "D:\\save_board_file\\" + storeFileName;
                boardFile.transferTo(new File(savePath));
                //board의 file을 관리하는 table에 저장처리(board_file_tb)
                boardRepository.saveFile(boardFileDTO);
            }
        }
    }
}
