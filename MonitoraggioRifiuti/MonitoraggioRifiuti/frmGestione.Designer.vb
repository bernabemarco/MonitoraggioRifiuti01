<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmGestione
    Inherits System.Windows.Forms.Form

    'Form esegue l'override del metodo Dispose per pulire l'elenco dei componenti.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Richiesto da Progettazione Windows Form
    Private components As System.ComponentModel.IContainer

    'NOTA: la procedura che segue è richiesta da Progettazione Windows Form
    'Può essere modificata in Progettazione Windows Form.  
    'Non modificarla mediante l'editor del codice.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmGestione))
        Dim DataGridViewCellStyle1 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle2 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Me.Biri_MonitoraggioRifiutiBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.Biri_MonitoraggioRifiutiBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.SicuraDataSet = New MonitoraggioRifiuti.SicuraDataSet()
        Me.BindingNavigatorCountItem = New System.Windows.Forms.ToolStripLabel()
        Me.BindingNavigatorMoveFirstItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMovePreviousItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorPositionItem = New System.Windows.Forms.ToolStripTextBox()
        Me.BindingNavigatorSeparator1 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorMoveNextItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveLastItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator2 = New System.Windows.Forms.ToolStripSeparator()
        Me.TextBoxFiltro = New System.Windows.Forms.ToolStripTextBox()
        Me.ToolStripSeparator5 = New System.Windows.Forms.ToolStripSeparator()
        Me.ApplicaFiltro = New System.Windows.Forms.ToolStripButton()
        Me.ToolStripSeparator1 = New System.Windows.Forms.ToolStripSeparator()
        Me.RimuoviFiltro = New System.Windows.Forms.ToolStripButton()
        Me.ToolStripSeparator2 = New System.Windows.Forms.ToolStripSeparator()
        Me.DettDoc = New System.Windows.Forms.ToolStripButton()
        Me.ToolStripSeparator6 = New System.Windows.Forms.ToolStripSeparator()
        Me.BtnTornaMain = New System.Windows.Forms.ToolStripButton()
        Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.ExtratesteRifiutiBnavigator = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.BindingNavigatorCountItem1 = New System.Windows.Forms.ToolStripLabel()
        Me.BindingNavigatorDeleteItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveFirstItem1 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMovePreviousItem1 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator3 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorPositionItem1 = New System.Windows.Forms.ToolStripTextBox()
        Me.BindingNavigatorSeparator4 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorMoveNextItem1 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveLastItem1 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator5 = New System.Windows.Forms.ToolStripSeparator()
        Me.ToolStripSeparator4 = New System.Windows.Forms.ToolStripSeparator()
        Me.SalvaRegistrazione = New System.Windows.Forms.ToolStripButton()
        Me.ToolStripSeparator3 = New System.Windows.Forms.ToolStripSeparator()
        Me.BtnAllegati = New System.Windows.Forms.ToolStripButton()
        Me.ToolStripButton1 = New System.Windows.Forms.ToolStripButton()
        Me.oDTP = New System.Windows.Forms.DateTimePicker()
        Me.Biri_MonitoraggioRifiutiDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn4 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn5 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn6 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn7 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.AlertConsegna = New System.Windows.Forms.DataGridViewImageColumn()
        Me.DataGridViewTextBoxColumn29 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn8 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn26 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn27 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn28 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ScadenzaImgList = New System.Windows.Forms.ImageList(Me.components)
        Me.EXTRATESTERIFIUTIDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn17 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn18 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn20 = New System.Windows.Forms.DataGridViewComboBoxColumn()
        Me.CodiciCERBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DataGridViewTextBoxColumn21 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn22 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewCheckBoxColumn1 = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.DataGridViewTextBoxColumn23 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn24 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn31 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn25 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn30 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Biri_MonitoraggioRifiutiTableAdapter = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.Biri_MonitoraggioRifiutiTableAdapter()
        Me.TableAdapterManager = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.TableAdapterManager()
        Me.EXTRATESTERIFIUTITableAdapter = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.EXTRATESTERIFIUTITableAdapter()
        Me.EXTRATESTERIFIUTIBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Codici_CERTableAdapter = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.Codici_CERTableAdapter()
        CType(Me.Biri_MonitoraggioRifiutiBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Biri_MonitoraggioRifiutiBindingNavigator.SuspendLayout()
        CType(Me.Biri_MonitoraggioRifiutiBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.SicuraDataSet, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.ExtratesteRifiutiBnavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.ExtratesteRifiutiBnavigator.SuspendLayout()
        CType(Me.Biri_MonitoraggioRifiutiDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.EXTRATESTERIFIUTIDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.CodiciCERBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.EXTRATESTERIFIUTIBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Biri_MonitoraggioRifiutiBindingNavigator
        '
        Me.Biri_MonitoraggioRifiutiBindingNavigator.AddNewItem = Nothing
        Me.Biri_MonitoraggioRifiutiBindingNavigator.BackColor = System.Drawing.SystemColors.GradientInactiveCaption
        Me.Biri_MonitoraggioRifiutiBindingNavigator.BindingSource = Me.Biri_MonitoraggioRifiutiBindingSource
        Me.Biri_MonitoraggioRifiutiBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.DeleteItem = Nothing
        Me.Biri_MonitoraggioRifiutiBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.TextBoxFiltro, Me.ToolStripSeparator5, Me.ApplicaFiltro, Me.ToolStripSeparator1, Me.RimuoviFiltro, Me.ToolStripSeparator2, Me.DettDoc, Me.ToolStripSeparator6, Me.BtnTornaMain})
        Me.Biri_MonitoraggioRifiutiBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.Biri_MonitoraggioRifiutiBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.Name = "Biri_MonitoraggioRifiutiBindingNavigator"
        Me.Biri_MonitoraggioRifiutiBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.Size = New System.Drawing.Size(1217, 26)
        Me.Biri_MonitoraggioRifiutiBindingNavigator.TabIndex = 0
        Me.Biri_MonitoraggioRifiutiBindingNavigator.Text = "BindingNavigator1"
        '
        'Biri_MonitoraggioRifiutiBindingSource
        '
        Me.Biri_MonitoraggioRifiutiBindingSource.DataMember = "Biri_MonitoraggioRifiuti"
        Me.Biri_MonitoraggioRifiutiBindingSource.DataSource = Me.SicuraDataSet
        '
        'SicuraDataSet
        '
        Me.SicuraDataSet.DataSetName = "SicuraDataSet"
        Me.SicuraDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'BindingNavigatorCountItem
        '
        Me.BindingNavigatorCountItem.Name = "BindingNavigatorCountItem"
        Me.BindingNavigatorCountItem.Size = New System.Drawing.Size(34, 23)
        Me.BindingNavigatorCountItem.Text = "di {0}"
        Me.BindingNavigatorCountItem.ToolTipText = "Numero totale di elementi"
        '
        'BindingNavigatorMoveFirstItem
        '
        Me.BindingNavigatorMoveFirstItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveFirstItem.Image = CType(resources.GetObject("BindingNavigatorMoveFirstItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveFirstItem.Name = "BindingNavigatorMoveFirstItem"
        Me.BindingNavigatorMoveFirstItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveFirstItem.Size = New System.Drawing.Size(23, 23)
        Me.BindingNavigatorMoveFirstItem.Text = "Sposta in prima posizione"
        '
        'BindingNavigatorMovePreviousItem
        '
        Me.BindingNavigatorMovePreviousItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMovePreviousItem.Image = CType(resources.GetObject("BindingNavigatorMovePreviousItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMovePreviousItem.Name = "BindingNavigatorMovePreviousItem"
        Me.BindingNavigatorMovePreviousItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMovePreviousItem.Size = New System.Drawing.Size(23, 23)
        Me.BindingNavigatorMovePreviousItem.Text = "Sposta indietro"
        '
        'BindingNavigatorSeparator
        '
        Me.BindingNavigatorSeparator.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator.Size = New System.Drawing.Size(6, 26)
        '
        'BindingNavigatorPositionItem
        '
        Me.BindingNavigatorPositionItem.AccessibleName = "Posizione"
        Me.BindingNavigatorPositionItem.AutoSize = False
        Me.BindingNavigatorPositionItem.Name = "BindingNavigatorPositionItem"
        Me.BindingNavigatorPositionItem.Size = New System.Drawing.Size(50, 23)
        Me.BindingNavigatorPositionItem.Text = "0"
        Me.BindingNavigatorPositionItem.ToolTipText = "Posizione corrente"
        '
        'BindingNavigatorSeparator1
        '
        Me.BindingNavigatorSeparator1.Name = "BindingNavigatorSeparator1"
        Me.BindingNavigatorSeparator1.Size = New System.Drawing.Size(6, 26)
        '
        'BindingNavigatorMoveNextItem
        '
        Me.BindingNavigatorMoveNextItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveNextItem.Image = CType(resources.GetObject("BindingNavigatorMoveNextItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveNextItem.Name = "BindingNavigatorMoveNextItem"
        Me.BindingNavigatorMoveNextItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveNextItem.Size = New System.Drawing.Size(23, 23)
        Me.BindingNavigatorMoveNextItem.Text = "Sposta avanti"
        '
        'BindingNavigatorMoveLastItem
        '
        Me.BindingNavigatorMoveLastItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveLastItem.Image = CType(resources.GetObject("BindingNavigatorMoveLastItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveLastItem.Name = "BindingNavigatorMoveLastItem"
        Me.BindingNavigatorMoveLastItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveLastItem.Size = New System.Drawing.Size(23, 23)
        Me.BindingNavigatorMoveLastItem.Text = "Sposta in ultima posizione"
        '
        'BindingNavigatorSeparator2
        '
        Me.BindingNavigatorSeparator2.Name = "BindingNavigatorSeparator2"
        Me.BindingNavigatorSeparator2.Size = New System.Drawing.Size(6, 26)
        '
        'TextBoxFiltro
        '
        Me.TextBoxFiltro.BackColor = System.Drawing.SystemColors.ActiveBorder
        Me.TextBoxFiltro.Font = New System.Drawing.Font("Segoe UI", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.TextBoxFiltro.Name = "TextBoxFiltro"
        Me.TextBoxFiltro.Size = New System.Drawing.Size(300, 26)
        Me.TextBoxFiltro.ToolTipText = "Inserisci qui i dati da Cercare"
        '
        'ToolStripSeparator5
        '
        Me.ToolStripSeparator5.Name = "ToolStripSeparator5"
        Me.ToolStripSeparator5.Size = New System.Drawing.Size(6, 26)
        '
        'ApplicaFiltro
        '
        Me.ApplicaFiltro.BackColor = System.Drawing.SystemColors.ActiveBorder
        Me.ApplicaFiltro.Font = New System.Drawing.Font("Segoe UI", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ApplicaFiltro.Image = Global.MonitoraggioRifiuti.My.Resources.Resources.icons8_ricerca_32__1_
        Me.ApplicaFiltro.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.ApplicaFiltro.Name = "ApplicaFiltro"
        Me.ApplicaFiltro.Padding = New System.Windows.Forms.Padding(1)
        Me.ApplicaFiltro.Size = New System.Drawing.Size(102, 23)
        Me.ApplicaFiltro.Text = "ApplicaFiltro"
        '
        'ToolStripSeparator1
        '
        Me.ToolStripSeparator1.AutoSize = False
        Me.ToolStripSeparator1.Name = "ToolStripSeparator1"
        Me.ToolStripSeparator1.Size = New System.Drawing.Size(25, 25)
        '
        'RimuoviFiltro
        '
        Me.RimuoviFiltro.BackColor = System.Drawing.Color.DarkSeaGreen
        Me.RimuoviFiltro.Font = New System.Drawing.Font("Segoe UI", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.RimuoviFiltro.Image = Global.MonitoraggioRifiuti.My.Resources.Resources.icons8_eliminare_32
        Me.RimuoviFiltro.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.RimuoviFiltro.Name = "RimuoviFiltro"
        Me.RimuoviFiltro.Size = New System.Drawing.Size(103, 23)
        Me.RimuoviFiltro.Text = "RimuoviFiltro"
        '
        'ToolStripSeparator2
        '
        Me.ToolStripSeparator2.AutoSize = False
        Me.ToolStripSeparator2.Name = "ToolStripSeparator2"
        Me.ToolStripSeparator2.Size = New System.Drawing.Size(25, 25)
        '
        'DettDoc
        '
        Me.DettDoc.BackColor = System.Drawing.Color.LightSteelBlue
        Me.DettDoc.Font = New System.Drawing.Font("Segoe UI", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.DettDoc.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.DettDoc.Name = "DettDoc"
        Me.DettDoc.Size = New System.Drawing.Size(65, 23)
        Me.DettDoc.Text = "Dettaglio"
        '
        'ToolStripSeparator6
        '
        Me.ToolStripSeparator6.AutoSize = False
        Me.ToolStripSeparator6.Name = "ToolStripSeparator6"
        Me.ToolStripSeparator6.Size = New System.Drawing.Size(25, 26)
        '
        'BtnTornaMain
        '
        Me.BtnTornaMain.AutoSize = False
        Me.BtnTornaMain.BackColor = System.Drawing.SystemColors.InactiveCaption
        Me.BtnTornaMain.ForeColor = System.Drawing.SystemColors.HotTrack
        Me.BtnTornaMain.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.BtnTornaMain.Name = "BtnTornaMain"
        Me.BtnTornaMain.Size = New System.Drawing.Size(65, 22)
        Me.BtnTornaMain.Text = "Torna"
        '
        'BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource
        '
        Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource.DataMember = "Biri_MonitoraggioRifiuti_EXTRATESTERIFIUTI"
        Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource.DataSource = Me.Biri_MonitoraggioRifiutiBindingSource
        '
        'ExtratesteRifiutiBnavigator
        '
        Me.ExtratesteRifiutiBnavigator.AddNewItem = Nothing
        Me.ExtratesteRifiutiBnavigator.BindingSource = Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource
        Me.ExtratesteRifiutiBnavigator.CountItem = Me.BindingNavigatorCountItem1
        Me.ExtratesteRifiutiBnavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.ExtratesteRifiutiBnavigator.Dock = System.Windows.Forms.DockStyle.None
        Me.ExtratesteRifiutiBnavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem1, Me.BindingNavigatorMovePreviousItem1, Me.BindingNavigatorSeparator3, Me.BindingNavigatorPositionItem1, Me.BindingNavigatorCountItem1, Me.BindingNavigatorSeparator4, Me.BindingNavigatorMoveNextItem1, Me.BindingNavigatorMoveLastItem1, Me.BindingNavigatorSeparator5, Me.ToolStripButton1, Me.BindingNavigatorDeleteItem, Me.ToolStripSeparator4, Me.SalvaRegistrazione, Me.ToolStripSeparator3, Me.BtnAllegati})
        Me.ExtratesteRifiutiBnavigator.Location = New System.Drawing.Point(0, 310)
        Me.ExtratesteRifiutiBnavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem1
        Me.ExtratesteRifiutiBnavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem1
        Me.ExtratesteRifiutiBnavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem1
        Me.ExtratesteRifiutiBnavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem1
        Me.ExtratesteRifiutiBnavigator.Name = "ExtratesteRifiutiBnavigator"
        Me.ExtratesteRifiutiBnavigator.PositionItem = Me.BindingNavigatorPositionItem1
        Me.ExtratesteRifiutiBnavigator.Size = New System.Drawing.Size(716, 25)
        Me.ExtratesteRifiutiBnavigator.TabIndex = 6
        Me.ExtratesteRifiutiBnavigator.Text = "BindingNavigator1"
        '
        'BindingNavigatorCountItem1
        '
        Me.BindingNavigatorCountItem1.Name = "BindingNavigatorCountItem1"
        Me.BindingNavigatorCountItem1.Size = New System.Drawing.Size(34, 22)
        Me.BindingNavigatorCountItem1.Text = "di {0}"
        Me.BindingNavigatorCountItem1.ToolTipText = "Numero totale di elementi"
        '
        'BindingNavigatorDeleteItem
        '
        Me.BindingNavigatorDeleteItem.Image = CType(resources.GetObject("BindingNavigatorDeleteItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorDeleteItem.Name = "BindingNavigatorDeleteItem"
        Me.BindingNavigatorDeleteItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorDeleteItem.Size = New System.Drawing.Size(66, 22)
        Me.BindingNavigatorDeleteItem.Text = "Elimina"
        '
        'BindingNavigatorMoveFirstItem1
        '
        Me.BindingNavigatorMoveFirstItem1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveFirstItem1.Image = CType(resources.GetObject("BindingNavigatorMoveFirstItem1.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveFirstItem1.Name = "BindingNavigatorMoveFirstItem1"
        Me.BindingNavigatorMoveFirstItem1.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveFirstItem1.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveFirstItem1.Text = "Sposta in prima posizione"
        '
        'BindingNavigatorMovePreviousItem1
        '
        Me.BindingNavigatorMovePreviousItem1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMovePreviousItem1.Image = CType(resources.GetObject("BindingNavigatorMovePreviousItem1.Image"), System.Drawing.Image)
        Me.BindingNavigatorMovePreviousItem1.Name = "BindingNavigatorMovePreviousItem1"
        Me.BindingNavigatorMovePreviousItem1.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMovePreviousItem1.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMovePreviousItem1.Text = "Sposta indietro"
        '
        'BindingNavigatorSeparator3
        '
        Me.BindingNavigatorSeparator3.Name = "BindingNavigatorSeparator3"
        Me.BindingNavigatorSeparator3.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorPositionItem1
        '
        Me.BindingNavigatorPositionItem1.AccessibleName = "Posizione"
        Me.BindingNavigatorPositionItem1.AutoSize = False
        Me.BindingNavigatorPositionItem1.Name = "BindingNavigatorPositionItem1"
        Me.BindingNavigatorPositionItem1.Size = New System.Drawing.Size(50, 23)
        Me.BindingNavigatorPositionItem1.Text = "0"
        Me.BindingNavigatorPositionItem1.ToolTipText = "Posizione corrente"
        '
        'BindingNavigatorSeparator4
        '
        Me.BindingNavigatorSeparator4.Name = "BindingNavigatorSeparator4"
        Me.BindingNavigatorSeparator4.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorMoveNextItem1
        '
        Me.BindingNavigatorMoveNextItem1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveNextItem1.Image = CType(resources.GetObject("BindingNavigatorMoveNextItem1.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveNextItem1.Name = "BindingNavigatorMoveNextItem1"
        Me.BindingNavigatorMoveNextItem1.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveNextItem1.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveNextItem1.Text = "Sposta avanti"
        '
        'BindingNavigatorMoveLastItem1
        '
        Me.BindingNavigatorMoveLastItem1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveLastItem1.Image = CType(resources.GetObject("BindingNavigatorMoveLastItem1.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveLastItem1.Name = "BindingNavigatorMoveLastItem1"
        Me.BindingNavigatorMoveLastItem1.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveLastItem1.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveLastItem1.Text = "Sposta in ultima posizione"
        '
        'BindingNavigatorSeparator5
        '
        Me.BindingNavigatorSeparator5.Name = "BindingNavigatorSeparator5"
        Me.BindingNavigatorSeparator5.Size = New System.Drawing.Size(6, 25)
        '
        'ToolStripSeparator4
        '
        Me.ToolStripSeparator4.AutoSize = False
        Me.ToolStripSeparator4.Name = "ToolStripSeparator4"
        Me.ToolStripSeparator4.Size = New System.Drawing.Size(25, 25)
        '
        'SalvaRegistrazione
        '
        Me.SalvaRegistrazione.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.SalvaRegistrazione.Font = New System.Drawing.Font("Segoe UI", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.SalvaRegistrazione.Image = Global.MonitoraggioRifiuti.My.Resources.Resources.FloppyDrive_16x_24
        Me.SalvaRegistrazione.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.SalvaRegistrazione.Name = "SalvaRegistrazione"
        Me.SalvaRegistrazione.Size = New System.Drawing.Size(141, 22)
        Me.SalvaRegistrazione.Text = "Salva Registrazione"
        '
        'ToolStripSeparator3
        '
        Me.ToolStripSeparator3.AutoSize = False
        Me.ToolStripSeparator3.Name = "ToolStripSeparator3"
        Me.ToolStripSeparator3.Size = New System.Drawing.Size(25, 25)
        '
        'BtnAllegati
        '
        Me.BtnAllegati.BackColor = System.Drawing.Color.LightSteelBlue
        Me.BtnAllegati.Font = New System.Drawing.Font("Segoe UI", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BtnAllegati.Image = Global.MonitoraggioRifiuti.My.Resources.Resources.icons8_attach_96
        Me.BtnAllegati.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.BtnAllegati.Name = "BtnAllegati"
        Me.BtnAllegati.Size = New System.Drawing.Size(71, 22)
        Me.BtnAllegati.Text = "Allegati"
        '
        'ToolStripButton1
        '
        Me.ToolStripButton1.Image = CType(resources.GetObject("ToolStripButton1.Image"), System.Drawing.Image)
        Me.ToolStripButton1.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.ToolStripButton1.Name = "ToolStripButton1"
        Me.ToolStripButton1.Size = New System.Drawing.Size(149, 22)
        Me.ToolStripButton1.Text = "Aggiungi Registrazione"
        '
        'oDTP
        '
        Me.oDTP.Location = New System.Drawing.Point(902, 310)
        Me.oDTP.Name = "oDTP"
        Me.oDTP.Size = New System.Drawing.Size(113, 20)
        Me.oDTP.TabIndex = 7
        '
        'Biri_MonitoraggioRifiutiDataGridView
        '
        Me.Biri_MonitoraggioRifiutiDataGridView.AutoGenerateColumns = False
        Me.Biri_MonitoraggioRifiutiDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Biri_MonitoraggioRifiutiDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn3, Me.DataGridViewTextBoxColumn4, Me.DataGridViewTextBoxColumn5, Me.DataGridViewTextBoxColumn6, Me.DataGridViewTextBoxColumn7, Me.AlertConsegna, Me.DataGridViewTextBoxColumn29, Me.DataGridViewTextBoxColumn8, Me.DataGridViewTextBoxColumn26, Me.DataGridViewTextBoxColumn27, Me.DataGridViewTextBoxColumn28})
        Me.Biri_MonitoraggioRifiutiDataGridView.DataSource = Me.Biri_MonitoraggioRifiutiBindingSource
        Me.Biri_MonitoraggioRifiutiDataGridView.Location = New System.Drawing.Point(0, 29)
        Me.Biri_MonitoraggioRifiutiDataGridView.Name = "Biri_MonitoraggioRifiutiDataGridView"
        Me.Biri_MonitoraggioRifiutiDataGridView.Size = New System.Drawing.Size(1197, 271)
        Me.Biri_MonitoraggioRifiutiDataGridView.TabIndex = 7
        '
        'DataGridViewTextBoxColumn1
        '
        Me.DataGridViewTextBoxColumn1.DataPropertyName = "PROGRESSIVO"
        Me.DataGridViewTextBoxColumn1.HeaderText = "PROGRESSIVO"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        Me.DataGridViewTextBoxColumn1.Visible = False
        '
        'DataGridViewTextBoxColumn3
        '
        Me.DataGridViewTextBoxColumn3.DataPropertyName = "ESERCIZIO"
        Me.DataGridViewTextBoxColumn3.HeaderText = "ANNO"
        Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
        Me.DataGridViewTextBoxColumn3.Width = 45
        '
        'DataGridViewTextBoxColumn4
        '
        Me.DataGridViewTextBoxColumn4.DataPropertyName = "TIPODOC"
        Me.DataGridViewTextBoxColumn4.HeaderText = "TIPODOC"
        Me.DataGridViewTextBoxColumn4.Name = "DataGridViewTextBoxColumn4"
        Me.DataGridViewTextBoxColumn4.Width = 65
        '
        'DataGridViewTextBoxColumn5
        '
        Me.DataGridViewTextBoxColumn5.DataPropertyName = "NUMERODOC"
        Me.DataGridViewTextBoxColumn5.HeaderText = "NUMDOC"
        Me.DataGridViewTextBoxColumn5.Name = "DataGridViewTextBoxColumn5"
        Me.DataGridViewTextBoxColumn5.Width = 65
        '
        'DataGridViewTextBoxColumn6
        '
        Me.DataGridViewTextBoxColumn6.DataPropertyName = "DataDoc"
        Me.DataGridViewTextBoxColumn6.HeaderText = "DataDoc"
        Me.DataGridViewTextBoxColumn6.Name = "DataGridViewTextBoxColumn6"
        Me.DataGridViewTextBoxColumn6.Width = 80
        '
        'DataGridViewTextBoxColumn7
        '
        Me.DataGridViewTextBoxColumn7.DataPropertyName = "StatoDoc"
        DataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter
        Me.DataGridViewTextBoxColumn7.DefaultCellStyle = DataGridViewCellStyle1
        Me.DataGridViewTextBoxColumn7.HeaderText = "StatoDoc"
        Me.DataGridViewTextBoxColumn7.Name = "DataGridViewTextBoxColumn7"
        Me.DataGridViewTextBoxColumn7.Width = 60
        '
        'AlertConsegna
        '
        Me.AlertConsegna.HeaderText = "AlertScadenza"
        Me.AlertConsegna.Name = "AlertConsegna"
        '
        'DataGridViewTextBoxColumn29
        '
        Me.DataGridViewTextBoxColumn29.DataPropertyName = "DATACONSEGNA"
        Me.DataGridViewTextBoxColumn29.HeaderText = "Consegna"
        Me.DataGridViewTextBoxColumn29.Name = "DataGridViewTextBoxColumn29"
        Me.DataGridViewTextBoxColumn29.Width = 80
        '
        'DataGridViewTextBoxColumn8
        '
        Me.DataGridViewTextBoxColumn8.DataPropertyName = "CODCONTO"
        Me.DataGridViewTextBoxColumn8.HeaderText = "CodConto"
        Me.DataGridViewTextBoxColumn8.Name = "DataGridViewTextBoxColumn8"
        Me.DataGridViewTextBoxColumn8.Width = 75
        '
        'DataGridViewTextBoxColumn26
        '
        Me.DataGridViewTextBoxColumn26.DataPropertyName = "CLIENTE"
        Me.DataGridViewTextBoxColumn26.HeaderText = "Cliente"
        Me.DataGridViewTextBoxColumn26.Name = "DataGridViewTextBoxColumn26"
        Me.DataGridViewTextBoxColumn26.Width = 300
        '
        'DataGridViewTextBoxColumn27
        '
        Me.DataGridViewTextBoxColumn27.DataPropertyName = "INDIRIZZO"
        Me.DataGridViewTextBoxColumn27.HeaderText = "Indirizzo"
        Me.DataGridViewTextBoxColumn27.Name = "DataGridViewTextBoxColumn27"
        Me.DataGridViewTextBoxColumn27.Width = 150
        '
        'DataGridViewTextBoxColumn28
        '
        Me.DataGridViewTextBoxColumn28.DataPropertyName = "LOCALITA"
        Me.DataGridViewTextBoxColumn28.HeaderText = "Localita"
        Me.DataGridViewTextBoxColumn28.Name = "DataGridViewTextBoxColumn28"
        Me.DataGridViewTextBoxColumn28.Width = 150
        '
        'ScadenzaImgList
        '
        Me.ScadenzaImgList.ImageStream = CType(resources.GetObject("ScadenzaImgList.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.ScadenzaImgList.TransparentColor = System.Drawing.Color.Transparent
        Me.ScadenzaImgList.Images.SetKeyName(0, "iconfinder_f-check_256_282474.png")
        Me.ScadenzaImgList.Images.SetKeyName(1, "iconfinder_bell-notifications-notice-notify-alert_3993856.png")
        Me.ScadenzaImgList.Images.SetKeyName(2, "iconfinder_caution_1055096.png")
        '
        'EXTRATESTERIFIUTIDataGridView
        '
        Me.EXTRATESTERIFIUTIDataGridView.AllowUserToAddRows = False
        Me.EXTRATESTERIFIUTIDataGridView.AutoGenerateColumns = False
        Me.EXTRATESTERIFIUTIDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.EXTRATESTERIFIUTIDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn17, Me.DataGridViewTextBoxColumn18, Me.DataGridViewTextBoxColumn20, Me.DataGridViewTextBoxColumn21, Me.DataGridViewTextBoxColumn22, Me.DataGridViewCheckBoxColumn1, Me.DataGridViewTextBoxColumn23, Me.DataGridViewTextBoxColumn24, Me.DataGridViewTextBoxColumn31, Me.DataGridViewTextBoxColumn25, Me.DataGridViewTextBoxColumn30})
        Me.EXTRATESTERIFIUTIDataGridView.DataSource = Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource
        Me.EXTRATESTERIFIUTIDataGridView.Location = New System.Drawing.Point(0, 338)
        Me.EXTRATESTERIFIUTIDataGridView.Name = "EXTRATESTERIFIUTIDataGridView"
        Me.EXTRATESTERIFIUTIDataGridView.Size = New System.Drawing.Size(1197, 220)
        Me.EXTRATESTERIFIUTIDataGridView.TabIndex = 7
        '
        'DataGridViewTextBoxColumn17
        '
        Me.DataGridViewTextBoxColumn17.DataPropertyName = "ID_Extratesterifiuti"
        Me.DataGridViewTextBoxColumn17.HeaderText = "ID_Extratesterifiuti"
        Me.DataGridViewTextBoxColumn17.Name = "DataGridViewTextBoxColumn17"
        Me.DataGridViewTextBoxColumn17.ReadOnly = True
        Me.DataGridViewTextBoxColumn17.Visible = False
        '
        'DataGridViewTextBoxColumn18
        '
        Me.DataGridViewTextBoxColumn18.DataPropertyName = "IDTESTA"
        Me.DataGridViewTextBoxColumn18.HeaderText = "IDTESTA"
        Me.DataGridViewTextBoxColumn18.Name = "DataGridViewTextBoxColumn18"
        Me.DataGridViewTextBoxColumn18.Visible = False
        '
        'DataGridViewTextBoxColumn20
        '
        Me.DataGridViewTextBoxColumn20.DataPropertyName = "TIPORIFIUTO"
        Me.DataGridViewTextBoxColumn20.DataSource = Me.CodiciCERBindingSource
        DataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DataGridViewTextBoxColumn20.DefaultCellStyle = DataGridViewCellStyle2
        Me.DataGridViewTextBoxColumn20.DisplayMember = "DescrizioneCerEstesa"
        Me.DataGridViewTextBoxColumn20.HeaderText = "TIPORIFIUTO"
        Me.DataGridViewTextBoxColumn20.Name = "DataGridViewTextBoxColumn20"
        Me.DataGridViewTextBoxColumn20.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DataGridViewTextBoxColumn20.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic
        Me.DataGridViewTextBoxColumn20.ValueMember = "ID"
        '
        'CodiciCERBindingSource
        '
        Me.CodiciCERBindingSource.DataMember = "Codici_CER"
        Me.CodiciCERBindingSource.DataSource = Me.SicuraDataSet
        '
        'DataGridViewTextBoxColumn21
        '
        Me.DataGridViewTextBoxColumn21.DataPropertyName = "GiustificativoCer"
        Me.DataGridViewTextBoxColumn21.HeaderText = "GiustificativoCer"
        Me.DataGridViewTextBoxColumn21.Name = "DataGridViewTextBoxColumn21"
        '
        'DataGridViewTextBoxColumn22
        '
        Me.DataGridViewTextBoxColumn22.DataPropertyName = "DataRitiro"
        Me.DataGridViewTextBoxColumn22.HeaderText = "DataRitiro"
        Me.DataGridViewTextBoxColumn22.Name = "DataGridViewTextBoxColumn22"
        '
        'DataGridViewCheckBoxColumn1
        '
        Me.DataGridViewCheckBoxColumn1.DataPropertyName = "Arrivo4Copia"
        Me.DataGridViewCheckBoxColumn1.HeaderText = "Arrivo4Copia"
        Me.DataGridViewCheckBoxColumn1.Name = "DataGridViewCheckBoxColumn1"
        '
        'DataGridViewTextBoxColumn23
        '
        Me.DataGridViewTextBoxColumn23.DataPropertyName = "DataArrivoFormulario"
        Me.DataGridViewTextBoxColumn23.HeaderText = "DataArrivoFormulario"
        Me.DataGridViewTextBoxColumn23.Name = "DataGridViewTextBoxColumn23"
        '
        'DataGridViewTextBoxColumn24
        '
        Me.DataGridViewTextBoxColumn24.DataPropertyName = "Note"
        Me.DataGridViewTextBoxColumn24.HeaderText = "Note"
        Me.DataGridViewTextBoxColumn24.Name = "DataGridViewTextBoxColumn24"
        '
        'DataGridViewTextBoxColumn31
        '
        Me.DataGridViewTextBoxColumn31.DataPropertyName = "Allegati"
        Me.DataGridViewTextBoxColumn31.HeaderText = "Allegati"
        Me.DataGridViewTextBoxColumn31.Name = "DataGridViewTextBoxColumn31"
        '
        'DataGridViewTextBoxColumn25
        '
        Me.DataGridViewTextBoxColumn25.DataPropertyName = "Datetime"
        Me.DataGridViewTextBoxColumn25.HeaderText = "Datetime"
        Me.DataGridViewTextBoxColumn25.Name = "DataGridViewTextBoxColumn25"
        '
        'DataGridViewTextBoxColumn30
        '
        Me.DataGridViewTextBoxColumn30.DataPropertyName = "UTENTEMODIFICA"
        Me.DataGridViewTextBoxColumn30.HeaderText = "UTENTEMODIFICA"
        Me.DataGridViewTextBoxColumn30.Name = "DataGridViewTextBoxColumn30"
        '
        'Biri_MonitoraggioRifiutiTableAdapter
        '
        Me.Biri_MonitoraggioRifiutiTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.Codici_CERTableAdapter = Nothing
        Me.TableAdapterManager.EXTRATESTEDOCTableAdapter = Nothing
        Me.TableAdapterManager.EXTRATESTERIFIUTITableAdapter = Me.EXTRATESTERIFIUTITableAdapter
        Me.TableAdapterManager.RIGHEDOCUMENTITableAdapter = Nothing
        Me.TableAdapterManager.UpdateOrder = MonitoraggioRifiuti.SicuraDataSetTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'EXTRATESTERIFIUTITableAdapter
        '
        Me.EXTRATESTERIFIUTITableAdapter.ClearBeforeFill = True
        '
        'EXTRATESTERIFIUTIBindingSource
        '
        Me.EXTRATESTERIFIUTIBindingSource.DataMember = "EXTRATESTERIFIUTI"
        Me.EXTRATESTERIFIUTIBindingSource.DataSource = Me.SicuraDataSet
        '
        'Codici_CERTableAdapter
        '
        Me.Codici_CERTableAdapter.ClearBeforeFill = True
        '
        'frmGestione
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1217, 612)
        Me.Controls.Add(Me.EXTRATESTERIFIUTIDataGridView)
        Me.Controls.Add(Me.Biri_MonitoraggioRifiutiDataGridView)
        Me.Controls.Add(Me.oDTP)
        Me.Controls.Add(Me.ExtratesteRifiutiBnavigator)
        Me.Controls.Add(Me.Biri_MonitoraggioRifiutiBindingNavigator)
        Me.Name = "frmGestione"
        Me.Text = "Gestione 1OS - ORS"
        CType(Me.Biri_MonitoraggioRifiutiBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Biri_MonitoraggioRifiutiBindingNavigator.ResumeLayout(False)
        Me.Biri_MonitoraggioRifiutiBindingNavigator.PerformLayout()
        CType(Me.Biri_MonitoraggioRifiutiBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.SicuraDataSet, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.ExtratesteRifiutiBnavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ExtratesteRifiutiBnavigator.ResumeLayout(False)
        Me.ExtratesteRifiutiBnavigator.PerformLayout()
        CType(Me.Biri_MonitoraggioRifiutiDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.EXTRATESTERIFIUTIDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.CodiciCERBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.EXTRATESTERIFIUTIBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents SicuraDataSet As SicuraDataSet
    Friend WithEvents Biri_MonitoraggioRifiutiBindingSource As BindingSource
    Friend WithEvents Biri_MonitoraggioRifiutiTableAdapter As SicuraDataSetTableAdapters.Biri_MonitoraggioRifiutiTableAdapter
    Friend WithEvents TableAdapterManager As SicuraDataSetTableAdapters.TableAdapterManager
    Friend WithEvents Biri_MonitoraggioRifiutiBindingNavigator As BindingNavigator
    Friend WithEvents BindingNavigatorCountItem As ToolStripLabel
    Friend WithEvents BindingNavigatorMoveFirstItem As ToolStripButton
    Friend WithEvents BindingNavigatorMovePreviousItem As ToolStripButton
    Friend WithEvents BindingNavigatorSeparator As ToolStripSeparator
    Friend WithEvents BindingNavigatorPositionItem As ToolStripTextBox
    Friend WithEvents BindingNavigatorSeparator1 As ToolStripSeparator
    Friend WithEvents BindingNavigatorMoveNextItem As ToolStripButton
    Friend WithEvents BindingNavigatorMoveLastItem As ToolStripButton
    Friend WithEvents BindingNavigatorSeparator2 As ToolStripSeparator
    Friend WithEvents EXTRATESTERIFIUTITableAdapter As SicuraDataSetTableAdapters.EXTRATESTERIFIUTITableAdapter
    Friend WithEvents EXTRATESTERIFIUTIBindingSource As BindingSource
    Friend WithEvents BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource As BindingSource
    Friend WithEvents DataGridViewTextBoxColumn2 As DataGridViewTextBoxColumn
    Friend WithEvents ExtratesteRifiutiBnavigator As BindingNavigator
    Friend WithEvents BindingNavigatorCountItem1 As ToolStripLabel
    Friend WithEvents BindingNavigatorDeleteItem As ToolStripButton
    Friend WithEvents BindingNavigatorMoveFirstItem1 As ToolStripButton
    Friend WithEvents BindingNavigatorMovePreviousItem1 As ToolStripButton
    Friend WithEvents BindingNavigatorSeparator3 As ToolStripSeparator
    Friend WithEvents BindingNavigatorPositionItem1 As ToolStripTextBox
    Friend WithEvents BindingNavigatorSeparator4 As ToolStripSeparator
    Friend WithEvents BindingNavigatorMoveNextItem1 As ToolStripButton
    Friend WithEvents BindingNavigatorMoveLastItem1 As ToolStripButton
    Friend WithEvents BindingNavigatorSeparator5 As ToolStripSeparator
    Friend WithEvents SalvaRegistrazione As ToolStripButton
    Friend WithEvents TextBoxFiltro As ToolStripTextBox
    Friend WithEvents ApplicaFiltro As ToolStripButton
    Friend WithEvents RimuoviFiltro As ToolStripButton
    Friend WithEvents DataGridViewTextBoxColumn9 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn10 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn14 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn15 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn16 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn19 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn11 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn12 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn13 As DataGridViewTextBoxColumn
    Friend WithEvents oDTP As DateTimePicker
    Friend WithEvents ToolStripSeparator1 As ToolStripSeparator
    Friend WithEvents ToolStripSeparator2 As ToolStripSeparator
    Friend WithEvents DettDoc As ToolStripButton
    Friend WithEvents ToolStripSeparator3 As ToolStripSeparator
    Friend WithEvents BtnAllegati As ToolStripButton
    Friend WithEvents ToolStripSeparator5 As ToolStripSeparator
    Friend WithEvents ToolStripSeparator4 As ToolStripSeparator
    Friend WithEvents ToolStripSeparator6 As ToolStripSeparator
    Friend WithEvents BtnTornaMain As ToolStripButton
    Friend WithEvents Biri_MonitoraggioRifiutiDataGridView As DataGridView
    Friend WithEvents ScadenzaImgList As ImageList
    Friend WithEvents DataGridViewTextBoxColumn1 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn3 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn4 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn5 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn6 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn7 As DataGridViewTextBoxColumn
    Friend WithEvents AlertConsegna As DataGridViewImageColumn
    Friend WithEvents DataGridViewTextBoxColumn29 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn8 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn26 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn27 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn28 As DataGridViewTextBoxColumn
    Friend WithEvents EXTRATESTERIFIUTIDataGridView As DataGridView
    Friend WithEvents CodiciCERBindingSource As BindingSource
    Friend WithEvents Codici_CERTableAdapter As SicuraDataSetTableAdapters.Codici_CERTableAdapter
    Friend WithEvents DataGridViewTextBoxColumn17 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn18 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn20 As DataGridViewComboBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn21 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn22 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewCheckBoxColumn1 As DataGridViewCheckBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn23 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn24 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn31 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn25 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn30 As DataGridViewTextBoxColumn
    Friend WithEvents ToolStripButton1 As ToolStripButton
End Class
