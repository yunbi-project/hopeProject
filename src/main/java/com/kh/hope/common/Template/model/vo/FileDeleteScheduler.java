package com.kh.hope.common.Template.model.vo;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.hope.board.model.service.BoardService;
import com.kh.hope.board.model.vo.BoardType;
import com.kh.hope.donate.model.service.DonateService;

import jakarta.servlet.ServletContext;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class FileDeleteScheduler {

	@Autowired
	private ServletContext application;
	
    @Autowired
    private ResourceLoader resourceLoader;
    
    @Autowired
    private BoardService service;
    
    @Autowired
    private DonateService donateService;

    @Scheduled(cron = "0 0 * * * *")
    public void deleteFile() {
    	List<String> list = service.selectFileList();

		//new File().listFiles();
		//file배열형태로 반환
		List<BoardType> boardTypeList = service.selectBoardTypeList();
		int count = 0;
		
		for(BoardType bt : boardTypeList) {
			
			//2)resources/images/board/T/에 있는 모든 이미지 파일 목록 조회
			File path = new File(application.getRealPath("/resources/images/board/"+bt.getBoardTypeNo()+"/"));
			File[] files = path.listFiles();//현재 디렉토리안에 존재하는 모든 파일을 배열형태로 반환
			
			List<File> fileList = Arrays.asList(files);
			
			
			if((!list.isEmpty())) {
				for( File serverFile : fileList ) {
					String fileName = serverFile.getName();//파일명 반환
					fileName="/resources/images/board/"+bt.getBoardTypeNo()+"/"+fileName;
					
					if(list.indexOf(fileName) == -1) {
						
						log.info(fileName+"을 삭제합니다.");
						count++;
						serverFile.delete();
					}
				}
			}
		}
		
      }
    
    @Scheduled(cron = "0 0 * * * *")
    public void deleteDonateFile() {
    	
    	List<String> list1 = donateService.selectDonateFileList();

    	int count = 0;
    	File path = new File(application.getRealPath("/resources/images/donate/"));
    	File[] files = path.listFiles();//현재 디렉토리안에 존재하는 모든 파일을 배열형태로 반환
    	
    	List<File> fileList = Arrays.asList(files);
    	
    	if((!list1.isEmpty())) {
    		for( File serverFile : fileList ) {
				String fileName = serverFile.getName();//파일명 반환
				fileName="/resources/images/donate/"+fileName;
				
				if(list1.indexOf(fileName) == -1) {
					
					log.info(fileName+"을 삭제합니다.");
					count++;
					serverFile.delete();
				}
			}
    	}
    	log.info("총 {}개의 파일이 삭제됨", count);
		log.info("파일삭제 스케쥴러 종료");
   }
  }

