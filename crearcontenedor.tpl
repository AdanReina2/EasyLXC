%include('header.tpl')
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <a href="index2.html" class="logo">
      <span class="logo-lg"><b>EasyLXC</b></span>
    </a>
  </header>
  <aside class="main-sidebar">
    <section class="sidebar">
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">UPTIME</li>
        <li class="treeview">
          <a href="/inicio">
            <i class="fa fa-arrow-up"></i> <span>{{ uptime }}</span>
          </a>
        </li>
      </ul>
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENÚ</li>
        <li class="treeview">
        	<li><a href="/"><i class="fa fa-window-maximize"></i>Página principal</a><li>
        </li>
        <li class="active treeview">
          <a href="/contenedores">
            <i class="fa fa-cubes"></i> <span>Contenedores</span>
          </a>
        </li>
        <li class="treeview">
                <li><a href="/snapshots"><i class="fa fa-camera-retro"></i>Snapshots</a></li>
        </li>
	<li class="treeview">
	  <li><a href="/monitor"><i class="fa fa-dashboard"></i>Monitorización de Ping</a></li>
	</li>
      </ul>
    </section>
  </aside>

  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Contenedores
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-window-maximize"></i>Home</a></li>
        <li><a href="#"><i class="fa fa-cubes"></i>Contenedores</a></li>
	<li class="active">Crear un nuevo contenedor</li>
      </ol>
    </section>
    <section class="content">
      <div class="box box-primary">
            <div class="box-header">
              <i class="fa fa-linux"></i>

              <h3 class="box-title">Selecciona la versión de linux que quieres utilizar para tu nuevo contenedor</h3>
            </div>
            <div class="box-body">
		  <div class="btn-group">
              <a class="btn btn-primary active btn-flat" href="#"><img src="/static/images/alpine.png">  Alpine</a>
        <button type="button" class="btn btn-primary active btn-flat dropdown-toggle"
                data-toggle="dropdown">
              <span class="caret"></span>
                      <span class="sr-only">Desplegar menú</span>
                    </button>

          <ul class="dropdown-menu" role="menu">
          <li><a href="/crearcontenedor2/alpine/3.4" title="3.4">3.4</a></li>
                     <li><a href="/crearcontenedor2/alpine/3.5" title="3.5">3.5</a></li>
                     <li><a href="/crearcontenedor2/alpine/3.6" title="3.6">3.6</a></li>
                     <li><a href="/crearcontenedor2/alpine/3.7" title="3.7">3.7</a></li>
                     <li><a href="/crearcontenedor2/alpine/edge" title="edge">edge</a></li>
          </ul>
      </div>
      <div class="btn-group">
              <a class="btn btn-info btn-flat" href="#"><img src="/static/images/archlinux.png">  Arch Linux</a>
        <button type="button" class="btn btn-info btn-flat dropdown-toggle"
                data-toggle="dropdown">
              <span class="caret"></span>
                      <span class="sr-only">Desplegar menú</span>
                    </button>

          <ul class="dropdown-menu" role="menu">
          <li><a href="/crearcontenedor2/archlinux/current" title="current">current</a></li>
          </ul>
      </div>
      <div class="btn-group">
              <a class="btn bg-yellow btn-flat" href="#"><img src="/static/images/centos.png">  CentOS</a>
        <button type="button" class="btn bg-yellow btn-flat dropdown-toggle"
                data-toggle="dropdown">
              <span class="caret"></span>
                      <span class="sr-only">Desplegar menú</span>
                    </button>

          <ul class="dropdown-menu" role="menu">
          <li><a href="/crearcontenedor2/centos/6" title="6">6</a></li>
                     <li><a href="/crearcontenedor2/centos/7" title="7">7</a></li>
          </ul>
      </div>
      <div class="btn-group">
              <a class="btn bg-maroon btn-flat" href="#"><img src="/static/images/debian.png">  Debian</a>
        <button type="button" class="btn bg-maroon btn-flat dropdown-toggle"
                data-toggle="dropdown">
              <span class="caret"></span>
                      <span class="sr-only">Desplegar menú</span>
                    </button>

          <ul class="dropdown-menu" role="menu">
          <li><a href="/crearcontenedor2/debian/wheezy" title="wheezy">Wheezy (7)</a></li>
                     <li><a href="/crearcontenedor2/debian/jessie" title="jessie">Jessie (8)</a></li>
                     <li><a href="/crearcontenedor2/debian/stretch" title="stretch">Stretch (9)</a></li>
                     <li><a href="/crearcontenedor2/debian/buster" title="buster">Buster (10)</a></li>
                     <li><a href="/crearcontenedor2/debian/sid" title="sid">Sid (Exp.)</a></li>
          </ul>
      </div>
      <div class="btn-group">
              <a class="btn bg-navy btn-flat" href="#"><img src="/static/images/fedora.png">  Fedora</a>
        <button type="button" class="btn bg-navy btn-flat dropdown-toggle"
                data-toggle="dropdown">
              <span class="caret"></span>
                      <span class="sr-only">Desplegar menú</span>
                    </button>

          <ul class="dropdown-menu" role="menu">
          <li><a href="/crearcontenedor2/fedora/26" title="26">26</a></li>
                     <li><a href="/crearcontenedor2/fedora/27" title="27">27</a></li>
          </ul>
      </div>
      <div class="btn-group">
              <a class="btn bg-purple btn-flat" href="#"><img src="/static/images/gentoo.png">  Gentoo</a>
        <button type="button" class="btn bg-purple btn-flat dropdown-toggle"
                data-toggle="dropdown">
              <span class="caret"></span>
                      <span class="sr-only">Desplegar menú</span>
                    </button>

          <ul class="dropdown-menu" role="menu">
          <li><a href="/crearcontenedor2/gentoo/current" title="current">current</a></li>
          </ul>
      </div>
      <div class="btn-group">
              <a class="btn btn-success btn-flat" href="#"><img src="/static/images/opensuse.png">  OpenSuse</a>
        <button type="button" class="btn btn-success btn-flat dropdown-toggle"
                data-toggle="dropdown">
              <span class="caret"></span>
                      <span class="sr-only">Desplegar menú</span>
                    </button>

          <ul class="dropdown-menu" role="menu">
          <li><a href="/crearcontenedor2/opensuse/42.3" title="42.3">42.3</a></li>
          </ul>
      </div>
      <div class="btn-group">
              <a class="btn bg-black btn-flat" href="#"><img src="/static/images/oracle.png">  Oracle</a>
        <button type="button" class="btn bg-black btn-flat dropdown-toggle"
                data-toggle="dropdown">
              <span class="caret"></span>
                      <span class="sr-only">Desplegar menú</span>
                    </button>

          <ul class="dropdown-menu" role="menu">
          <li><a href="/crearcontenedor2/oracle/6" title="6">6</a></li>
                     <li><a href="/crearcontenedor2/oracle/7" title="7">7</a></li>
          </ul>
      </div>
      <div class="btn-group">
              <a class="btn bg-orange btn-flat" href="#"><img src="/static/images/ubuntu.png">  Ubuntu</a>
        <button type="button" class="btn bg-orange btn-flat dropdown-toggle"
                data-toggle="dropdown">
              <span class="caret"></span>
                      <span class="sr-only">Desplegar menú</span>
                    </button>

          <ul class="dropdown-menu" role="menu">
          <li><a href="/crearcontenedor2/ubuntu/artful" title="artful">Artful</a></li>
                     <li><a href="/crearcontenedor2/ubuntu/bionic" title="bionuc">Bionic</a></li>
                     <li><a href="/crearcontenedor2/ubuntu/trusty" title="trusty">Trusty</a></li>
                     <li><a href="/crearcontenedor2/ubuntu/xenial" title="xenial">Xenial</a></li>
          </ul>
      </div>
                  </div>
            <div class="box-footer clearfix"></div>
          </div>
    </section>
  </div>
%include('foot.tpl')
