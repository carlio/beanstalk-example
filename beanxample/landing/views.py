from django.views.generic import TemplateView

from landing.models import PageView


class LandingPage(TemplateView):
    template_name = 'landing.html'

    def get(self, request, *args, **kwargs):
        PageView.objects.create()
        return super().get(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        ctx = super().get_context_data(**kwargs)
        ctx['count'] = PageView.objects.count()
        return ctx
