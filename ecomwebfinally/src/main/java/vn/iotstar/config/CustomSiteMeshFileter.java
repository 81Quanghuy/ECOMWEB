package vn.iotstar.config;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CustomSiteMeshFileter extends ConfigurableSiteMeshFilter {

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		builder.addDecoratorPath("/seller/*", "/decorators/seller.jsp")
				.addDecoratorPath("/admin/*", "/decorators/admin.jsp").addDecoratorPath("/*", "/decorators/user.jsp")

				.addExcludedPath("/login*").addExcludedPath("/resgiter*").addExcludedPath("/forgot_password")
				.addExcludedPath("/reset_password");
	}
}
