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
        Me.SicuraDataSet = New MonitoraggioRifiuti.SicuraDataSet()
        Me.Biri_MonitoraggioRifiutiBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Biri_MonitoraggioRifiutiTableAdapter = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.Biri_MonitoraggioRifiutiTableAdapter()
        Me.TableAdapterManager = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.TableAdapterManager()
        Me.EXTRATESTERIFIUTITableAdapter = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.EXTRATESTERIFIUTITableAdapter()
        Me.Biri_MonitoraggioRifiutiBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
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
        Me.EXTRATESTERIFIUTIBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.EXTRATESTERIFIUTIDataGridView = New System.Windows.Forms.DataGridView()
        Me.CodiciCERBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.SicuraDataSet1 = New MonitoraggioRifiuti.SicuraDataSet()
        Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource1 = New System.Windows.Forms.BindingSource(Me.components)
        Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.ExtratesterifiutiTableAdapter1 = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.EXTRATESTERIFIUTITableAdapter()
        Me.BindingNavigator1 = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.BindingNavigatorAddNewItem = New System.Windows.Forms.ToolStripButton()
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
        Me.Biri_MonitoraggioRifiutiDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn4 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn5 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn6 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn7 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn8 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.CLIENTE = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.INDIRIZZO = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.LOCALITA = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn11 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn12 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn13 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.oDTP = New System.Windows.Forms.DateTimePicker()
        Me.Codici_CERTableAdapter = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.Codici_CERTableAdapter()
        Me.DataGridViewTextBoxColumn17 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn18 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn20 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.TipoCer = New System.Windows.Forms.DataGridViewComboBoxColumn()
        Me.DataGridViewTextBoxColumn21 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewCheckBoxColumn1 = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.DataGridViewTextBoxColumn22 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn23 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Allegati = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn24 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn25 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        CType(Me.SicuraDataSet, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Biri_MonitoraggioRifiutiBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Biri_MonitoraggioRifiutiBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Biri_MonitoraggioRifiutiBindingNavigator.SuspendLayout()
        CType(Me.EXTRATESTERIFIUTIBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.EXTRATESTERIFIUTIDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.CodiciCERBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.SicuraDataSet1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BindingNavigator1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.BindingNavigator1.SuspendLayout()
        CType(Me.Biri_MonitoraggioRifiutiDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'SicuraDataSet
        '
        Me.SicuraDataSet.DataSetName = "SicuraDataSet"
        Me.SicuraDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'Biri_MonitoraggioRifiutiBindingSource
        '
        Me.Biri_MonitoraggioRifiutiBindingSource.DataMember = "Biri_MonitoraggioRifiuti"
        Me.Biri_MonitoraggioRifiutiBindingSource.DataSource = Me.SicuraDataSet
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
        Me.Biri_MonitoraggioRifiutiBindingNavigator.Size = New System.Drawing.Size(1189, 26)
        Me.Biri_MonitoraggioRifiutiBindingNavigator.TabIndex = 0
        Me.Biri_MonitoraggioRifiutiBindingNavigator.Text = "BindingNavigator1"
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
        'EXTRATESTERIFIUTIBindingSource
        '
        Me.EXTRATESTERIFIUTIBindingSource.DataMember = "EXTRATESTERIFIUTI"
        Me.EXTRATESTERIFIUTIBindingSource.DataSource = Me.SicuraDataSet
        '
        'EXTRATESTERIFIUTIDataGridView
        '
        Me.EXTRATESTERIFIUTIDataGridView.AutoGenerateColumns = False
        DataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control
        DataGridViewCellStyle1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText
        DataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.EXTRATESTERIFIUTIDataGridView.ColumnHeadersDefaultCellStyle = DataGridViewCellStyle1
        Me.EXTRATESTERIFIUTIDataGridView.ColumnHeadersHeight = 30
        Me.EXTRATESTERIFIUTIDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn17, Me.DataGridViewTextBoxColumn18, Me.DataGridViewTextBoxColumn20, Me.TipoCer, Me.DataGridViewTextBoxColumn21, Me.DataGridViewCheckBoxColumn1, Me.DataGridViewTextBoxColumn22, Me.DataGridViewTextBoxColumn23, Me.Allegati, Me.DataGridViewTextBoxColumn24, Me.DataGridViewTextBoxColumn25})
        Me.EXTRATESTERIFIUTIDataGridView.DataSource = Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource1
        DataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window
        DataGridViewCellStyle2.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText
        DataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.[False]
        Me.EXTRATESTERIFIUTIDataGridView.DefaultCellStyle = DataGridViewCellStyle2
        Me.EXTRATESTERIFIUTIDataGridView.Location = New System.Drawing.Point(0, 338)
        Me.EXTRATESTERIFIUTIDataGridView.Name = "EXTRATESTERIFIUTIDataGridView"
        Me.EXTRATESTERIFIUTIDataGridView.RowTemplate.Height = 24
        Me.EXTRATESTERIFIUTIDataGridView.Size = New System.Drawing.Size(1177, 147)
        Me.EXTRATESTERIFIUTIDataGridView.TabIndex = 2
        '
        'CodiciCERBindingSource
        '
        Me.CodiciCERBindingSource.DataMember = "Codici_CER"
        Me.CodiciCERBindingSource.DataSource = Me.SicuraDataSet1
        '
        'SicuraDataSet1
        '
        Me.SicuraDataSet1.DataSetName = "SicuraDataSet"
        Me.SicuraDataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource1
        '
        Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource1.DataMember = "Biri_MonitoraggioRifiuti_EXTRATESTERIFIUTI"
        Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource1.DataSource = Me.Biri_MonitoraggioRifiutiBindingSource
        '
        'BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource
        '
        Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource.DataMember = "Biri_MonitoraggioRifiuti_EXTRATESTERIFIUTI"
        Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource.DataSource = Me.Biri_MonitoraggioRifiutiBindingSource
        '
        'ExtratesterifiutiTableAdapter1
        '
        Me.ExtratesterifiutiTableAdapter1.ClearBeforeFill = True
        '
        'BindingNavigator1
        '
        Me.BindingNavigator1.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.BindingNavigator1.CountItem = Me.BindingNavigatorCountItem1
        Me.BindingNavigator1.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.BindingNavigator1.Dock = System.Windows.Forms.DockStyle.None
        Me.BindingNavigator1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem1, Me.BindingNavigatorMovePreviousItem1, Me.BindingNavigatorSeparator3, Me.BindingNavigatorPositionItem1, Me.BindingNavigatorCountItem1, Me.BindingNavigatorSeparator4, Me.BindingNavigatorMoveNextItem1, Me.BindingNavigatorMoveLastItem1, Me.BindingNavigatorSeparator5, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.ToolStripSeparator4, Me.SalvaRegistrazione, Me.ToolStripSeparator3, Me.BtnAllegati})
        Me.BindingNavigator1.Location = New System.Drawing.Point(0, 310)
        Me.BindingNavigator1.MoveFirstItem = Me.BindingNavigatorMoveFirstItem1
        Me.BindingNavigator1.MoveLastItem = Me.BindingNavigatorMoveLastItem1
        Me.BindingNavigator1.MoveNextItem = Me.BindingNavigatorMoveNextItem1
        Me.BindingNavigator1.MovePreviousItem = Me.BindingNavigatorMovePreviousItem1
        Me.BindingNavigator1.Name = "BindingNavigator1"
        Me.BindingNavigator1.PositionItem = Me.BindingNavigatorPositionItem1
        Me.BindingNavigator1.Size = New System.Drawing.Size(516, 25)
        Me.BindingNavigator1.TabIndex = 6
        Me.BindingNavigator1.Text = "BindingNavigator1"
        '
        'BindingNavigatorAddNewItem
        '
        Me.BindingNavigatorAddNewItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorAddNewItem.Image = CType(resources.GetObject("BindingNavigatorAddNewItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorAddNewItem.Name = "BindingNavigatorAddNewItem"
        Me.BindingNavigatorAddNewItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorAddNewItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorAddNewItem.Text = "Aggiungi nuovo"
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
        Me.BindingNavigatorDeleteItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorDeleteItem.Image = CType(resources.GetObject("BindingNavigatorDeleteItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorDeleteItem.Name = "BindingNavigatorDeleteItem"
        Me.BindingNavigatorDeleteItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorDeleteItem.Size = New System.Drawing.Size(23, 22)
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
        'Biri_MonitoraggioRifiutiDataGridView
        '
        Me.Biri_MonitoraggioRifiutiDataGridView.AutoGenerateColumns = False
        Me.Biri_MonitoraggioRifiutiDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn4, Me.DataGridViewTextBoxColumn5, Me.DataGridViewTextBoxColumn3, Me.DataGridViewTextBoxColumn6, Me.DataGridViewTextBoxColumn7, Me.DataGridViewTextBoxColumn8, Me.CLIENTE, Me.INDIRIZZO, Me.LOCALITA, Me.DataGridViewTextBoxColumn11, Me.DataGridViewTextBoxColumn12, Me.DataGridViewTextBoxColumn13})
        Me.Biri_MonitoraggioRifiutiDataGridView.DataSource = Me.Biri_MonitoraggioRifiutiBindingSource
        Me.Biri_MonitoraggioRifiutiDataGridView.Location = New System.Drawing.Point(0, 28)
        Me.Biri_MonitoraggioRifiutiDataGridView.Name = "Biri_MonitoraggioRifiutiDataGridView"
        Me.Biri_MonitoraggioRifiutiDataGridView.Size = New System.Drawing.Size(1177, 264)
        Me.Biri_MonitoraggioRifiutiDataGridView.TabIndex = 6
        '
        'DataGridViewTextBoxColumn1
        '
        Me.DataGridViewTextBoxColumn1.DataPropertyName = "PROGRESSIVO"
        Me.DataGridViewTextBoxColumn1.Frozen = True
        Me.DataGridViewTextBoxColumn1.HeaderText = "PROGRESSIVO"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        Me.DataGridViewTextBoxColumn1.Visible = False
        '
        'DataGridViewTextBoxColumn4
        '
        Me.DataGridViewTextBoxColumn4.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn4.DataPropertyName = "TIPODOC"
        Me.DataGridViewTextBoxColumn4.Frozen = True
        Me.DataGridViewTextBoxColumn4.HeaderText = "TIPODOC"
        Me.DataGridViewTextBoxColumn4.Name = "DataGridViewTextBoxColumn4"
        Me.DataGridViewTextBoxColumn4.Width = 80
        '
        'DataGridViewTextBoxColumn5
        '
        Me.DataGridViewTextBoxColumn5.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn5.DataPropertyName = "NUMERODOC"
        Me.DataGridViewTextBoxColumn5.Frozen = True
        Me.DataGridViewTextBoxColumn5.HeaderText = "NUMERODOC"
        Me.DataGridViewTextBoxColumn5.Name = "DataGridViewTextBoxColumn5"
        Me.DataGridViewTextBoxColumn5.Width = 103
        '
        'DataGridViewTextBoxColumn3
        '
        Me.DataGridViewTextBoxColumn3.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn3.DataPropertyName = "ESERCIZIO"
        Me.DataGridViewTextBoxColumn3.HeaderText = "ESERCIZIO"
        Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
        Me.DataGridViewTextBoxColumn3.Width = 89
        '
        'DataGridViewTextBoxColumn6
        '
        Me.DataGridViewTextBoxColumn6.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn6.DataPropertyName = "DataDoc"
        Me.DataGridViewTextBoxColumn6.HeaderText = "DataDoc"
        Me.DataGridViewTextBoxColumn6.Name = "DataGridViewTextBoxColumn6"
        Me.DataGridViewTextBoxColumn6.Width = 75
        '
        'DataGridViewTextBoxColumn7
        '
        Me.DataGridViewTextBoxColumn7.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn7.DataPropertyName = "StatoDoc"
        Me.DataGridViewTextBoxColumn7.HeaderText = "StatoDoc"
        Me.DataGridViewTextBoxColumn7.Name = "DataGridViewTextBoxColumn7"
        Me.DataGridViewTextBoxColumn7.Width = 77
        '
        'DataGridViewTextBoxColumn8
        '
        Me.DataGridViewTextBoxColumn8.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn8.DataPropertyName = "CODCONTO"
        Me.DataGridViewTextBoxColumn8.HeaderText = "CODCONTO"
        Me.DataGridViewTextBoxColumn8.Name = "DataGridViewTextBoxColumn8"
        Me.DataGridViewTextBoxColumn8.Width = 93
        '
        'CLIENTE
        '
        Me.CLIENTE.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.CLIENTE.DataPropertyName = "CLIENTE"
        Me.CLIENTE.HeaderText = "CLIENTE"
        Me.CLIENTE.Name = "CLIENTE"
        Me.CLIENTE.Width = 77
        '
        'INDIRIZZO
        '
        Me.INDIRIZZO.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.INDIRIZZO.DataPropertyName = "INDIRIZZO"
        Me.INDIRIZZO.HeaderText = "INDIRIZZO"
        Me.INDIRIZZO.Name = "INDIRIZZO"
        Me.INDIRIZZO.Width = 87
        '
        'LOCALITA
        '
        Me.LOCALITA.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.LOCALITA.DataPropertyName = "LOCALITA"
        Me.LOCALITA.HeaderText = "LOCALITA"
        Me.LOCALITA.Name = "LOCALITA"
        Me.LOCALITA.Width = 83
        '
        'DataGridViewTextBoxColumn11
        '
        Me.DataGridViewTextBoxColumn11.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn11.DataPropertyName = "TipodocSucc"
        Me.DataGridViewTextBoxColumn11.HeaderText = "TipodocSucc"
        Me.DataGridViewTextBoxColumn11.Name = "DataGridViewTextBoxColumn11"
        Me.DataGridViewTextBoxColumn11.Width = 96
        '
        'DataGridViewTextBoxColumn12
        '
        Me.DataGridViewTextBoxColumn12.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn12.DataPropertyName = "NumerodocSucc"
        Me.DataGridViewTextBoxColumn12.HeaderText = "NumerodocSucc"
        Me.DataGridViewTextBoxColumn12.Name = "DataGridViewTextBoxColumn12"
        Me.DataGridViewTextBoxColumn12.Width = 112
        '
        'DataGridViewTextBoxColumn13
        '
        Me.DataGridViewTextBoxColumn13.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn13.DataPropertyName = "DataDocSucc"
        Me.DataGridViewTextBoxColumn13.HeaderText = "DataDocSucc"
        Me.DataGridViewTextBoxColumn13.Name = "DataGridViewTextBoxColumn13"
        '
        'oDTP
        '
        Me.oDTP.Location = New System.Drawing.Point(1024, 483)
        Me.oDTP.Name = "oDTP"
        Me.oDTP.Size = New System.Drawing.Size(113, 20)
        Me.oDTP.TabIndex = 7
        '
        'Codici_CERTableAdapter
        '
        Me.Codici_CERTableAdapter.ClearBeforeFill = True
        '
        'DataGridViewTextBoxColumn17
        '
        Me.DataGridViewTextBoxColumn17.DataPropertyName = "ID_Extratesterifiuti"
        Me.DataGridViewTextBoxColumn17.HeaderText = "ID_Extratesterifiuti"
        Me.DataGridViewTextBoxColumn17.Name = "DataGridViewTextBoxColumn17"
        Me.DataGridViewTextBoxColumn17.ReadOnly = True
        Me.DataGridViewTextBoxColumn17.Visible = False
        Me.DataGridViewTextBoxColumn17.Width = 131
        '
        'DataGridViewTextBoxColumn18
        '
        Me.DataGridViewTextBoxColumn18.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.AllCells
        Me.DataGridViewTextBoxColumn18.DataPropertyName = "IDTESTA"
        Me.DataGridViewTextBoxColumn18.HeaderText = "IDTESTA"
        Me.DataGridViewTextBoxColumn18.Name = "DataGridViewTextBoxColumn18"
        Me.DataGridViewTextBoxColumn18.Visible = False
        Me.DataGridViewTextBoxColumn18.Width = 81
        '
        'DataGridViewTextBoxColumn20
        '
        Me.DataGridViewTextBoxColumn20.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.AllCells
        Me.DataGridViewTextBoxColumn20.DataPropertyName = "GiustificativoCer"
        Me.DataGridViewTextBoxColumn20.HeaderText = "GiustificativoCer"
        Me.DataGridViewTextBoxColumn20.Name = "DataGridViewTextBoxColumn20"
        Me.DataGridViewTextBoxColumn20.Width = 119
        '
        'TipoCer
        '
        Me.TipoCer.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.TipoCer.DataPropertyName = "TIPORIFIUTO"
        Me.TipoCer.DataSource = Me.CodiciCERBindingSource
        Me.TipoCer.DisplayMember = "DescrizioneCerEstesa"
        Me.TipoCer.HeaderText = "TipoCer"
        Me.TipoCer.Name = "TipoCer"
        Me.TipoCer.ValueMember = "ID"
        Me.TipoCer.Width = 56
        '
        'DataGridViewTextBoxColumn21
        '
        Me.DataGridViewTextBoxColumn21.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn21.DataPropertyName = "DataRitiro"
        Me.DataGridViewTextBoxColumn21.HeaderText = "DataRitiro"
        Me.DataGridViewTextBoxColumn21.Name = "DataGridViewTextBoxColumn21"
        Me.DataGridViewTextBoxColumn21.Width = 87
        '
        'DataGridViewCheckBoxColumn1
        '
        Me.DataGridViewCheckBoxColumn1.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewCheckBoxColumn1.DataPropertyName = "Arrivo4Copia"
        Me.DataGridViewCheckBoxColumn1.HeaderText = "Arrivo4Copia"
        Me.DataGridViewCheckBoxColumn1.Name = "DataGridViewCheckBoxColumn1"
        Me.DataGridViewCheckBoxColumn1.Width = 82
        '
        'DataGridViewTextBoxColumn22
        '
        Me.DataGridViewTextBoxColumn22.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn22.DataPropertyName = "DataArrivoFormulario"
        Me.DataGridViewTextBoxColumn22.HeaderText = "DataArrivoFormulario"
        Me.DataGridViewTextBoxColumn22.Name = "DataGridViewTextBoxColumn22"
        Me.DataGridViewTextBoxColumn22.Width = 148
        '
        'DataGridViewTextBoxColumn23
        '
        Me.DataGridViewTextBoxColumn23.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn23.DataPropertyName = "Note"
        Me.DataGridViewTextBoxColumn23.HeaderText = "Note"
        Me.DataGridViewTextBoxColumn23.Name = "DataGridViewTextBoxColumn23"
        Me.DataGridViewTextBoxColumn23.Width = 58
        '
        'Allegati
        '
        Me.Allegati.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.Allegati.DataPropertyName = "Allegati"
        Me.Allegati.HeaderText = "Allegati"
        Me.Allegati.Name = "Allegati"
        Me.Allegati.Width = 72
        '
        'DataGridViewTextBoxColumn24
        '
        Me.DataGridViewTextBoxColumn24.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn24.DataPropertyName = "Datetime"
        Me.DataGridViewTextBoxColumn24.HeaderText = "Datetime"
        Me.DataGridViewTextBoxColumn24.Name = "DataGridViewTextBoxColumn24"
        Me.DataGridViewTextBoxColumn24.Visible = False
        Me.DataGridViewTextBoxColumn24.Width = 82
        '
        'DataGridViewTextBoxColumn25
        '
        Me.DataGridViewTextBoxColumn25.DataPropertyName = "UTENTEMODIFICA"
        Me.DataGridViewTextBoxColumn25.HeaderText = "UTENTEMODIFICA"
        Me.DataGridViewTextBoxColumn25.Name = "DataGridViewTextBoxColumn25"
        Me.DataGridViewTextBoxColumn25.Visible = False
        Me.DataGridViewTextBoxColumn25.Width = 137
        '
        'frmGestione
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1189, 505)
        Me.Controls.Add(Me.oDTP)
        Me.Controls.Add(Me.Biri_MonitoraggioRifiutiDataGridView)
        Me.Controls.Add(Me.BindingNavigator1)
        Me.Controls.Add(Me.EXTRATESTERIFIUTIDataGridView)
        Me.Controls.Add(Me.Biri_MonitoraggioRifiutiBindingNavigator)
        Me.Name = "frmGestione"
        Me.Text = "Gestione 1OS - ORS"
        CType(Me.SicuraDataSet, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Biri_MonitoraggioRifiutiBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Biri_MonitoraggioRifiutiBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Biri_MonitoraggioRifiutiBindingNavigator.ResumeLayout(False)
        Me.Biri_MonitoraggioRifiutiBindingNavigator.PerformLayout()
        CType(Me.EXTRATESTERIFIUTIBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.EXTRATESTERIFIUTIDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.CodiciCERBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.SicuraDataSet1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BindingNavigator1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.BindingNavigator1.ResumeLayout(False)
        Me.BindingNavigator1.PerformLayout()
        CType(Me.Biri_MonitoraggioRifiutiDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
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
    Friend WithEvents EXTRATESTERIFIUTIDataGridView As DataGridView
    Friend WithEvents BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource As BindingSource
    Friend WithEvents ExtratesterifiutiTableAdapter1 As SicuraDataSetTableAdapters.EXTRATESTERIFIUTITableAdapter
    Friend WithEvents DataGridViewTextBoxColumn2 As DataGridViewTextBoxColumn
    Friend WithEvents BindingNavigator1 As BindingNavigator
    Friend WithEvents BindingNavigatorAddNewItem As ToolStripButton
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
    Friend WithEvents Biri_MonitoraggioRifiutiDataGridView As DataGridView
    Friend WithEvents DataGridViewTextBoxColumn9 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn10 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn14 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn15 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn16 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn19 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn1 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn4 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn5 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn3 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn6 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn7 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn8 As DataGridViewTextBoxColumn
    Friend WithEvents CLIENTE As DataGridViewTextBoxColumn
    Friend WithEvents INDIRIZZO As DataGridViewTextBoxColumn
    Friend WithEvents LOCALITA As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn11 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn12 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn13 As DataGridViewTextBoxColumn
    Friend WithEvents oDTP As DateTimePicker
    Friend WithEvents SicuraDataSet1 As SicuraDataSet
    Friend WithEvents CodiciCERBindingSource As BindingSource
    Friend WithEvents Codici_CERTableAdapter As SicuraDataSetTableAdapters.Codici_CERTableAdapter
    Friend WithEvents BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource1 As BindingSource
    Friend WithEvents ToolStripSeparator1 As ToolStripSeparator
    Friend WithEvents ToolStripSeparator2 As ToolStripSeparator
    Friend WithEvents DettDoc As ToolStripButton
    Friend WithEvents ToolStripSeparator3 As ToolStripSeparator
    Friend WithEvents BtnAllegati As ToolStripButton
    Friend WithEvents ToolStripSeparator5 As ToolStripSeparator
    Friend WithEvents ToolStripSeparator4 As ToolStripSeparator
    Friend WithEvents ToolStripSeparator6 As ToolStripSeparator
    Friend WithEvents BtnTornaMain As ToolStripButton
    Friend WithEvents DataGridViewTextBoxColumn17 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn18 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn20 As DataGridViewTextBoxColumn
    Friend WithEvents TipoCer As DataGridViewComboBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn21 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewCheckBoxColumn1 As DataGridViewCheckBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn22 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn23 As DataGridViewTextBoxColumn
    Friend WithEvents Allegati As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn24 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn25 As DataGridViewTextBoxColumn
End Class
