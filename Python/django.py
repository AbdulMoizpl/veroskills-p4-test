
from django.contrib import admin
from django.urls import path, include
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView, TokenVerifyView


admin.autodiscover()
admin.site.enable_nav_sidebar = False
admin.site.site_header = 'Veroskills admin'
admin.site.site_title = 'System Management'
admin.site.index_title = 'Veroskills system management'

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('api/token/verify/', TokenVerifyView.as_view(), name='token_verify'),
    path('api/', include("veroskills_user_classifier.urls"))
]