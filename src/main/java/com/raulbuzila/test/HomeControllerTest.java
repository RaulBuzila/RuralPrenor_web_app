package com.raulbuzila.test;

/**
 * Created by raulbuzila on 6/6/2017.
 */
import static
        org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static
        org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static
        org.springframework.test.web.servlet.setup.MockMvcBuilders.*;
import com.raulbuzila.web.controller.HomeController;
import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;

public class HomeControllerTest {
  @Test
  public void testHomePage() throws Exception{
    HomeController controller = new HomeController();
    MockMvc mockMvc = standaloneSetup(controller).build();

    mockMvc.perform(get("/"))
            .andExpect(view().name("home"));
  }
}
