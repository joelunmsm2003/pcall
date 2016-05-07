from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.contrib.auth.models import User


admin.autodiscover()


urlpatterns = patterns('',

    url(r'^admin/', include(admin.site.urls)),
    url(r'^ingresar/$', 'PeruCall.views.ingresar'),
    url(r'^changepass/$', 'PeruCall.views.changepass'),
    url(r'^salir/$', 'PeruCall.views.salir'),
    url(r'^menu/$', 'PeruCall.views.menu'),
    url(r'^usuario/$', 'PeruCall.views.usuario'),
    url(r'^usuarios/$', 'PeruCall.views.usuarios'),
    url(r'^agentes/$', 'PeruCall.views.agentes'),
    url(r'^empresa/', 'PeruCall.views.empresa'),
    url(r'^empresas/', 'PeruCall.views.empresas'),
    url(r'^usuarios/$', 'PeruCall.views.usuarios'),
    url(r'^usuario/', 'PeruCall.views.usuario'),
    url(r'^user/', 'PeruCall.views.user'),
    url(r'^nivel/', 'PeruCall.views.nivel'),
    url(r'^$', 'PeruCall.views.ingresar'), 
    url(r'^campania/', 'PeruCall.views.campania'), 
    url(r'^campanias/', 'PeruCall.views.campanias'),  
    url(r'^uploadCampania/', 'PeruCall.views.uploadCampania'),
    url(r'^adminCampania/(\w+)/$', 'PeruCall.views.adminCampania'),
    url(r'^agentesdisponibles/(\w+)/$', 'PeruCall.views.agentesdisponibles'),
    url(r'^agentescampania/(\w+)/$', 'PeruCall.views.agentescampania'),
    url(r'^agregaragente/', 'PeruCall.views.agregaragente'),
    url(r'^quitaragente/', 'PeruCall.views.quitaragente'),
    url(r'^supervisores/', 'PeruCall.views.supervisores'),
    url(r'^reasignarsupervisor/', 'PeruCall.views.reasignarsupervisor'),
    url(r'^nota/', 'PeruCall.views.nota'),
    url(r'^enviar/$','PeruCall.views.enviar'),
    url(r'^uploaduser/$','PeruCall.views.uploaduser'),
    url(r'^notificar/$','PeruCall.views.notificar'),
    url(r'^licencia/$','PeruCall.views.licencia'),
    url(r'^licencias/$','PeruCall.views.licencias'),
    url(r'^lanzallamada/(\w+)/(\w+)/$','PeruCall.views.lanzallamada'),
    url(r'^finllamada/(\w+)/$','PeruCall.views.finllamada'),
    url(r'^lictmp/$','PeruCall.views.lictmp'),
    url(r'^agendar/$','PeruCall.views.agendar'),
    url(r'^getcampanias/(\w+)/$','PeruCall.views.getcampanias'),
    url(r'^reportecsv/(\w+)/(\w+)/$','PeruCall.views.reportecsv'),
    url(r'^dashboard/(\w+)/(\w+)/$','PeruCall.views.dashboard'),
    url(r'^resultadocampania/(\w+)/(\w+)/$','PeruCall.views.resultadocampania'),
    url(r'^campaniaresult/(\w+)/(\w+)/$','PeruCall.views.campaniaresult'),
    url(r'^traercampania/(\w+)/$','PeruCall.views.traercampania'),
    url(r'^passcampania/(\w+)/$','PeruCall.views.passcampania'),
    url(r'^infocampania/(\w+)/$','PeruCall.views.infocampania'),
    url(r'^getempresa/$','PeruCall.views.getempresa'),
    url(r'^detallesupervisormant/(\w+)/$','PeruCall.views.detallesupervisormant'),
    url(r'^detallesupervisor/(\w+)/$','PeruCall.views.detallesupervisor'),
    url(r'^totalestllam/$','PeruCall.views.totalestllam'),
    url(r'^lanzaespera/$','PeruCall.views.lanzaespera'),
    url(r'^agentegrafico/$','PeruCall.views.agentegrafico'),
    url(r'^getanexo/(\w+)/$','PeruCall.views.getanexo'),
    url(r'^pausarcampania/(\w+)/$','PeruCall.views.pausarcampania'),
    url(r'^filtroscampania/(\w+)/$','PeruCall.views.filtroscampania'),
    url(r'^reportedetallado/$','PeruCall.views.reportedetallado'),
    url(r'^agesup/(\w+)/$','PeruCall.views.agesup'),
    url(r'^receso/(\w+)/$','PeruCall.views.receso'),
    url(r'^sshh/(\w+)/$','PeruCall.views.sshh'),
    url(r'^busqueda/$','PeruCall.views.busqueda'),
    url(r'^duracionagente/(\w+)/$','PeruCall.views.duracionagente'),
    url(r'^generacsv/(\w+)/(\w+)/(\w+)/(\w+)/(\w+)/(\w+)/$','PeruCall.views.generacsv'),


    url(r'^agentescalifica/(\w+)/$','PeruCall.views.agentescalifica'),
    url(r'^agentesall/(\w+)/$','PeruCall.views.agentesall'),
    url(r'^resultadoagente/(\w+)/(\w+)/$','PeruCall.views.resultadoagente'),
    url(r'^examenes/$', 'PeruCall.views.examenes'),
    url(r'^monitoreo/(\w+)/$', 'PeruCall.views.monitoreo'),
    url(r'^agentes/(\w+)/$', 'PeruCall.views.agentes'),
    url(r'^troncales/$', 'PeruCall.views.troncales'),
    url(r'^filtros/(\w+)/$', 'PeruCall.views.filtros'),
    url(r'^carterasupervisor/(\w+)/$', 'PeruCall.views.carterasupervisor'),
    url(r'^carteranosupervisor/(\w+)/$', 'PeruCall.views.carteranosupervisor'),
    url(r'^listafiltros/(\w+)/$', 'PeruCall.views.listafiltros'),
    url(r'^getexamen/(\w+)/$', 'PeruCall.views.getexamen'),
    url(r'^botoneragraph/(\w+)/$', 'PeruCall.views.botoneragraph'),
    url(r'^accionmonitor/(\w+)/(\w+)$', 'PeruCall.views.accionmonitor'),
    url(r'^accionsusurro/(\w+)/(\w+)$', 'PeruCall.views.accionsusurro'),
    url(r'^agentesupervisor/(\w+)/$', 'PeruCall.views.agentesupervisor'),
    url(r'^agentenosupervisor/(\w+)/$', 'PeruCall.views.agentenosupervisor'),
    url(r'^detalleagente/(\w+)/$', 'PeruCall.views.detalleagente'),


    url(r'^agregarsupervisor/', 'PeruCall.views.agregarsupervisor'),
    url(r'^quitarsupervisor/', 'PeruCall.views.quitarsupervisor'),
    url(r'^getcamp/(\w+)/', 'PeruCall.views.getcamp'),
    url(r'^botoneraagente/(\w+)/', 'PeruCall.views.botoneraagente'),

    url(r'^cartera/', 'PeruCall.views.cartera'),
    url(r'^carteras/', 'PeruCall.views.carteras'),
    url(r'^supervisorcartera/(\w+)/$', 'PeruCall.views.supervisorcartera'),
    url(r'^agregarfiltro/', 'PeruCall.views.agregarfiltro'),
    url(r'^eliminarfiltro/', 'PeruCall.views.eliminarfiltro'),
    url(r'^reportes/(\w+)/$', 'PeruCall.views.reportes'),
    url(r'^resultadofiltro/(\w+)/$', 'PeruCall.views.resultadofiltro'),
    url(r'^home/', 'PeruCall.views.home'),
    url(r'^reporteg/(\w+)/', 'PeruCall.views.reporteg'),
    url(r'^agregarcartera/', 'PeruCall.views.agregarcartera'),
    url(r'^cliente/(\w+)/$', 'PeruCall.views.cliente'),
    url(r'^agente/(\w+)/$', 'PeruCall.views.agente'),
    url(r'^atendida/(\w+)/$', 'PeruCall.views.atendida'),
    url(r'^desfase/(\w+)/$', 'PeruCall.views.desfase'),
    url(r'^botonera/$', 'PeruCall.views.botonera'),
    url(r'^gestion/$', 'PeruCall.views.gestion'),
    url(r'^tgestion/(\w+)/$', 'PeruCall.views.tgestion'),
    url(r'^gestionupdate/$', 'PeruCall.views.gestionupdate'),
    url(r'^tllamada/(\w+)/(\w+)/$', 'PeruCall.views.tllamada'),
    url(r'^pausa/(\w+)/$', 'PeruCall.views.pausa'),
    url(r'^play/(\w+)/$', 'PeruCall.views.play'),
    url(r'^header/(\w+)/$', 'PeruCall.views.header'),
    url(r'^base/$', 'PeruCall.views.base'),
    url(r'^activafiltro/(\w+)/(\w+)/$', 'PeruCall.views.activafiltro'),
    url(r'^desactivafiltro/(\w+)/(\w+)/$', 'PeruCall.views.desactivafiltro'),
    url(r'^game/$', 'PeruCall.views.game'),
    url(r'^activafiltro/$', 'PeruCall.views.activafiltro'),
    url(r'^mascaras/$', 'PeruCall.views.mascaras'),
    url(r'^preguntas/(\w+)/$', 'PeruCall.views.preguntas'),
    url(r'^pregunta/$', 'PeruCall.views.pregunta'),
    url(r'^estllamada/(\w+)/$', 'PeruCall.views.estllamada'),
    url(r'^calificar/$', 'PeruCall.views.calificar'),
    url(r'^examen/$', 'PeruCall.views.examen'),
  
    url(r'^teleoperador/(\w+)/$', 'PeruCall.views.teleoperador'),
    url(r'^menu/$', 'PeruCall.views.menu'),

    url(r'^status_f/(\w+)/$', 'PeruCall.views.status_f'),
    url(r'^status_g/(\w+)/$', 'PeruCall.views.status_g'),
    url(r'^status_h/(\w+)/$', 'PeruCall.views.status_h'),
    url(r'^resultado/(\w+)/$', 'PeruCall.views.resultado'),
    url(r'^resultadototal/$', 'PeruCall.views.resultadototal'),
    url(r'^cpuestado/$', 'PeruCall.views.cpuestado'),
    url(r'^astapp/$', 'PeruCall.views.astapp'),
    url(r'^monitorcpu/$', 'PeruCall.views.monitorcpu'),
    url(r'^graphcpu/$', 'PeruCall.views.graphcpu'),
    url(r'^botonexterno/$', 'PeruCall.views.botonexterno'),
    url(r'^getestado/(\w+)/$', 'PeruCall.views.getestado'),
    url(r'^activarcampania/(\w+)/$', 'PeruCall.views.activarcampania'),



)



