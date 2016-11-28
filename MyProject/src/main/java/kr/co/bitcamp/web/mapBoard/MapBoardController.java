package kr.co.bitcamp.web.mapBoard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.bitcamp.service.mapBoard.MapBoardService;

@Controller
@RequestMapping("/mapBoard/*")
public class MapBoardController {
    
    @Autowired
    @Qualifier("mapBoardServiceImpl")
    private MapBoardService boardService;

    public MapBoardController() {
        super();
        System.out.println("MapBoardController 생성");
    }

    public void setBoardService(MapBoardService boardService) {
        this.boardService = boardService;
    }
    
    
    
    
    
    

}
