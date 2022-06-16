package qintess.academiajava.classes.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class ServletSpringMvc extends AbstractAnnotationConfigDispatcherServletInitializer{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] { 
			AppWebConfiguration.class
			//, JpaConfiguration.class 
			};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		//return new Class[] { AppWebConfiguration.class };
		return new Class[] { };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/"};
	}

}
