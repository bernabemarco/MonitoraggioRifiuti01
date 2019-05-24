<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Gestione
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
        Dim GiustificativoCerLabel As System.Windows.Forms.Label
        Dim DataRitiroLabel As System.Windows.Forms.Label
        Dim Arrivo4CopiaLabel As System.Windows.Forms.Label
        Dim DataArrivoFormularioLabel As System.Windows.Forms.Label
        Dim NoteLabel As System.Windows.Forms.Label
        Dim AllegatiLabel As System.Windows.Forms.Label
        Dim DataRitiroLabel1 As System.Windows.Forms.Label
        Dim DataArrivoFormularioLabel1 As System.Windows.Forms.Label
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Gestione))
        Me.Biri_MonitoraggioRifiutiBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.BindingNavigatorAddNewItem = New System.Windows.Forms.ToolStripButton()
        Me.Biri_MonitoraggioRifiutiBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.SicuraDataSet = New MonitoraggioRifiuti.SicuraDataSet()
        Me.BindingNavigatorCountItem = New System.Windows.Forms.ToolStripLabel()
        Me.BindingNavigatorDeleteItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveFirstItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMovePreviousItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorPositionItem = New System.Windows.Forms.ToolStripTextBox()
        Me.BindingNavigatorSeparator1 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorMoveNextItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveLastItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator2 = New System.Windows.Forms.ToolStripSeparator()
        Me.Biri_MonitoraggioRifiutiBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.Biri_MonitoraggioRifiutiDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn2 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn4 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn5 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn6 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn7 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn11 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn12 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn13 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.EXTRATESTERIFIUTIBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.GiustificativoCerTextBox = New System.Windows.Forms.TextBox()
        Me.Arrivo4CopiaCheckBox = New System.Windows.Forms.CheckBox()
        Me.NoteTextBox = New System.Windows.Forms.TextBox()
        Me.AllegatiTextBox = New System.Windows.Forms.TextBox()
        Me.Button1 = New System.Windows.Forms.Button()
        Me.BindingNavigator1 = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.BindingNavigatorCountItem1 = New System.Windows.Forms.ToolStripLabel()
        Me.BindingNavigatorDeleteItem1 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveFirstItem1 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMovePreviousItem1 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator3 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorPositionItem1 = New System.Windows.Forms.ToolStripTextBox()
        Me.BindingNavigatorSeparator4 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorMoveNextItem1 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveLastItem1 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator5 = New System.Windows.Forms.ToolStripSeparator()
        Me.ToolStripButton1 = New System.Windows.Forms.ToolStripButton()
        Me.DataFormularioTB = New System.Windows.Forms.TextBox()
        Me.DataRitiroTb = New System.Windows.Forms.TextBox()
        Me.oDTPRitiro = New System.Windows.Forms.DateTimePicker()
        Me.oDTPFormulario = New System.Windows.Forms.DateTimePicker()
        Me.CodiciCERBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Biri_MonitoraggioRifiutiTableAdapter = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.Biri_MonitoraggioRifiutiTableAdapter()
        Me.TableAdapterManager = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.TableAdapterManager()
        Me.EXTRATESTERIFIUTITableAdapter = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.EXTRATESTERIFIUTITableAdapter()
        Me.Codici_CERTableAdapter = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.Codici_CERTableAdapter()
        Me.FKEXTRATESTERIFIUTICodiciCERBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.tiporifiuto = New System.Windows.Forms.ComboBox()
        Me.DataRitiroDateTimePicker = New System.Windows.Forms.DateTimePicker()
        Me.DataArrivoFormularioDateTimePicker = New System.Windows.Forms.DateTimePicker()
        GiustificativoCerLabel = New System.Windows.Forms.Label()
        DataRitiroLabel = New System.Windows.Forms.Label()
        Arrivo4CopiaLabel = New System.Windows.Forms.Label()
        DataArrivoFormularioLabel = New System.Windows.Forms.Label()
        NoteLabel = New System.Windows.Forms.Label()
        AllegatiLabel = New System.Windows.Forms.Label()
        DataRitiroLabel1 = New System.Windows.Forms.Label()
        DataArrivoFormularioLabel1 = New System.Windows.Forms.Label()
        CType(Me.Biri_MonitoraggioRifiutiBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Biri_MonitoraggioRifiutiBindingNavigator.SuspendLayout()
        CType(Me.Biri_MonitoraggioRifiutiBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.SicuraDataSet, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Biri_MonitoraggioRifiutiDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.EXTRATESTERIFIUTIBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BindingNavigator1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.BindingNavigator1.SuspendLayout()
        CType(Me.CodiciCERBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.FKEXTRATESTERIFIUTICodiciCERBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'GiustificativoCerLabel
        '
        GiustificativoCerLabel.AutoSize = True
        GiustificativoCerLabel.Location = New System.Drawing.Point(50, 373)
        GiustificativoCerLabel.Name = "GiustificativoCerLabel"
        GiustificativoCerLabel.Size = New System.Drawing.Size(89, 13)
        GiustificativoCerLabel.TabIndex = 8
        GiustificativoCerLabel.Text = "Giustificativo Cer:"
        '
        'DataRitiroLabel
        '
        DataRitiroLabel.AutoSize = True
        DataRitiroLabel.Location = New System.Drawing.Point(50, 400)
        DataRitiroLabel.Name = "DataRitiroLabel"
        DataRitiroLabel.Size = New System.Drawing.Size(60, 13)
        DataRitiroLabel.TabIndex = 10
        DataRitiroLabel.Text = "Data Ritiro:"
        '
        'Arrivo4CopiaLabel
        '
        Arrivo4CopiaLabel.AutoSize = True
        Arrivo4CopiaLabel.Location = New System.Drawing.Point(50, 427)
        Arrivo4CopiaLabel.Name = "Arrivo4CopiaLabel"
        Arrivo4CopiaLabel.Size = New System.Drawing.Size(70, 13)
        Arrivo4CopiaLabel.TabIndex = 12
        Arrivo4CopiaLabel.Text = "Arrivo4Copia:"
        '
        'DataArrivoFormularioLabel
        '
        DataArrivoFormularioLabel.AutoSize = True
        DataArrivoFormularioLabel.Location = New System.Drawing.Point(50, 456)
        DataArrivoFormularioLabel.Name = "DataArrivoFormularioLabel"
        DataArrivoFormularioLabel.Size = New System.Drawing.Size(114, 13)
        DataArrivoFormularioLabel.TabIndex = 14
        DataArrivoFormularioLabel.Text = "Data Arrivo Formulario:"
        '
        'NoteLabel
        '
        NoteLabel.AutoSize = True
        NoteLabel.Location = New System.Drawing.Point(50, 481)
        NoteLabel.Name = "NoteLabel"
        NoteLabel.Size = New System.Drawing.Size(33, 13)
        NoteLabel.TabIndex = 16
        NoteLabel.Text = "Note:"
        '
        'AllegatiLabel
        '
        AllegatiLabel.AutoSize = True
        AllegatiLabel.Location = New System.Drawing.Point(50, 559)
        AllegatiLabel.Name = "AllegatiLabel"
        AllegatiLabel.Size = New System.Drawing.Size(44, 13)
        AllegatiLabel.TabIndex = 22
        AllegatiLabel.Text = "Allegati:"
        '
        'DataRitiroLabel1
        '
        DataRitiroLabel1.AutoSize = True
        DataRitiroLabel1.Location = New System.Drawing.Point(624, 401)
        DataRitiroLabel1.Name = "DataRitiroLabel1"
        DataRitiroLabel1.Size = New System.Drawing.Size(60, 13)
        DataRitiroLabel1.TabIndex = 30
        DataRitiroLabel1.Text = "Data Ritiro:"
        '
        'DataArrivoFormularioLabel1
        '
        DataArrivoFormularioLabel1.AutoSize = True
        DataArrivoFormularioLabel1.Location = New System.Drawing.Point(616, 460)
        DataArrivoFormularioLabel1.Name = "DataArrivoFormularioLabel1"
        DataArrivoFormularioLabel1.Size = New System.Drawing.Size(114, 13)
        DataArrivoFormularioLabel1.TabIndex = 31
        DataArrivoFormularioLabel1.Text = "Data Arrivo Formulario:"
        '
        'Biri_MonitoraggioRifiutiBindingNavigator
        '
        Me.Biri_MonitoraggioRifiutiBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.BindingSource = Me.Biri_MonitoraggioRifiutiBindingSource
        Me.Biri_MonitoraggioRifiutiBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.Biri_MonitoraggioRifiutiBindingNavigatorSaveItem})
        Me.Biri_MonitoraggioRifiutiBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.Biri_MonitoraggioRifiutiBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.Name = "Biri_MonitoraggioRifiutiBindingNavigator"
        Me.Biri_MonitoraggioRifiutiBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.Size = New System.Drawing.Size(1088, 25)
        Me.Biri_MonitoraggioRifiutiBindingNavigator.TabIndex = 0
        Me.Biri_MonitoraggioRifiutiBindingNavigator.Text = "BindingNavigator1"
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
        Me.BindingNavigatorCountItem.Size = New System.Drawing.Size(34, 22)
        Me.BindingNavigatorCountItem.Text = "di {0}"
        Me.BindingNavigatorCountItem.ToolTipText = "Numero totale di elementi"
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
        'BindingNavigatorMoveFirstItem
        '
        Me.BindingNavigatorMoveFirstItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveFirstItem.Image = CType(resources.GetObject("BindingNavigatorMoveFirstItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveFirstItem.Name = "BindingNavigatorMoveFirstItem"
        Me.BindingNavigatorMoveFirstItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveFirstItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveFirstItem.Text = "Sposta in prima posizione"
        '
        'BindingNavigatorMovePreviousItem
        '
        Me.BindingNavigatorMovePreviousItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMovePreviousItem.Image = CType(resources.GetObject("BindingNavigatorMovePreviousItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMovePreviousItem.Name = "BindingNavigatorMovePreviousItem"
        Me.BindingNavigatorMovePreviousItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMovePreviousItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMovePreviousItem.Text = "Sposta indietro"
        '
        'BindingNavigatorSeparator
        '
        Me.BindingNavigatorSeparator.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator.Size = New System.Drawing.Size(6, 25)
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
        Me.BindingNavigatorSeparator1.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorMoveNextItem
        '
        Me.BindingNavigatorMoveNextItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveNextItem.Image = CType(resources.GetObject("BindingNavigatorMoveNextItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveNextItem.Name = "BindingNavigatorMoveNextItem"
        Me.BindingNavigatorMoveNextItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveNextItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveNextItem.Text = "Sposta avanti"
        '
        'BindingNavigatorMoveLastItem
        '
        Me.BindingNavigatorMoveLastItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveLastItem.Image = CType(resources.GetObject("BindingNavigatorMoveLastItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveLastItem.Name = "BindingNavigatorMoveLastItem"
        Me.BindingNavigatorMoveLastItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveLastItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveLastItem.Text = "Sposta in ultima posizione"
        '
        'BindingNavigatorSeparator2
        '
        Me.BindingNavigatorSeparator2.Name = "BindingNavigatorSeparator2"
        Me.BindingNavigatorSeparator2.Size = New System.Drawing.Size(6, 25)
        '
        'Biri_MonitoraggioRifiutiBindingNavigatorSaveItem
        '
        Me.Biri_MonitoraggioRifiutiBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.Biri_MonitoraggioRifiutiBindingNavigatorSaveItem.Enabled = False
        Me.Biri_MonitoraggioRifiutiBindingNavigatorSaveItem.Image = CType(resources.GetObject("Biri_MonitoraggioRifiutiBindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.Biri_MonitoraggioRifiutiBindingNavigatorSaveItem.Name = "Biri_MonitoraggioRifiutiBindingNavigatorSaveItem"
        Me.Biri_MonitoraggioRifiutiBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 22)
        Me.Biri_MonitoraggioRifiutiBindingNavigatorSaveItem.Text = "Salva dati"
        '
        'Biri_MonitoraggioRifiutiDataGridView
        '
        Me.Biri_MonitoraggioRifiutiDataGridView.AutoGenerateColumns = False
        Me.Biri_MonitoraggioRifiutiDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Biri_MonitoraggioRifiutiDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn2, Me.DataGridViewTextBoxColumn3, Me.DataGridViewTextBoxColumn4, Me.DataGridViewTextBoxColumn5, Me.DataGridViewTextBoxColumn6, Me.DataGridViewTextBoxColumn7, Me.DataGridViewTextBoxColumn11, Me.DataGridViewTextBoxColumn12, Me.DataGridViewTextBoxColumn13})
        Me.Biri_MonitoraggioRifiutiDataGridView.DataSource = Me.Biri_MonitoraggioRifiutiBindingSource
        Me.Biri_MonitoraggioRifiutiDataGridView.Location = New System.Drawing.Point(0, 28)
        Me.Biri_MonitoraggioRifiutiDataGridView.Name = "Biri_MonitoraggioRifiutiDataGridView"
        Me.Biri_MonitoraggioRifiutiDataGridView.Size = New System.Drawing.Size(1068, 220)
        Me.Biri_MonitoraggioRifiutiDataGridView.TabIndex = 1
        '
        'DataGridViewTextBoxColumn1
        '
        Me.DataGridViewTextBoxColumn1.DataPropertyName = "PROGRESSIVO"
        Me.DataGridViewTextBoxColumn1.HeaderText = "PROGRESSIVO"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        '
        'DataGridViewTextBoxColumn2
        '
        Me.DataGridViewTextBoxColumn2.DataPropertyName = "ESERCIZIO"
        Me.DataGridViewTextBoxColumn2.HeaderText = "ESERCIZIO"
        Me.DataGridViewTextBoxColumn2.Name = "DataGridViewTextBoxColumn2"
        '
        'DataGridViewTextBoxColumn3
        '
        Me.DataGridViewTextBoxColumn3.DataPropertyName = "TIPODOC"
        Me.DataGridViewTextBoxColumn3.HeaderText = "TIPODOC"
        Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
        '
        'DataGridViewTextBoxColumn4
        '
        Me.DataGridViewTextBoxColumn4.DataPropertyName = "NUMERODOC"
        Me.DataGridViewTextBoxColumn4.HeaderText = "NUMERODOC"
        Me.DataGridViewTextBoxColumn4.Name = "DataGridViewTextBoxColumn4"
        '
        'DataGridViewTextBoxColumn5
        '
        Me.DataGridViewTextBoxColumn5.DataPropertyName = "DataDoc"
        Me.DataGridViewTextBoxColumn5.HeaderText = "DataDoc"
        Me.DataGridViewTextBoxColumn5.Name = "DataGridViewTextBoxColumn5"
        '
        'DataGridViewTextBoxColumn6
        '
        Me.DataGridViewTextBoxColumn6.DataPropertyName = "StatoDoc"
        Me.DataGridViewTextBoxColumn6.HeaderText = "StatoDoc"
        Me.DataGridViewTextBoxColumn6.Name = "DataGridViewTextBoxColumn6"
        '
        'DataGridViewTextBoxColumn7
        '
        Me.DataGridViewTextBoxColumn7.DataPropertyName = "CODCONTO"
        Me.DataGridViewTextBoxColumn7.HeaderText = "CODCONTO"
        Me.DataGridViewTextBoxColumn7.Name = "DataGridViewTextBoxColumn7"
        '
        'DataGridViewTextBoxColumn11
        '
        Me.DataGridViewTextBoxColumn11.DataPropertyName = "CLIENTE"
        Me.DataGridViewTextBoxColumn11.HeaderText = "CLIENTE"
        Me.DataGridViewTextBoxColumn11.Name = "DataGridViewTextBoxColumn11"
        '
        'DataGridViewTextBoxColumn12
        '
        Me.DataGridViewTextBoxColumn12.DataPropertyName = "INDIRIZZO"
        Me.DataGridViewTextBoxColumn12.HeaderText = "INDIRIZZO"
        Me.DataGridViewTextBoxColumn12.Name = "DataGridViewTextBoxColumn12"
        '
        'DataGridViewTextBoxColumn13
        '
        Me.DataGridViewTextBoxColumn13.DataPropertyName = "LOCALITA"
        Me.DataGridViewTextBoxColumn13.HeaderText = "LOCALITA"
        Me.DataGridViewTextBoxColumn13.Name = "DataGridViewTextBoxColumn13"
        '
        'EXTRATESTERIFIUTIBindingSource
        '
        Me.EXTRATESTERIFIUTIBindingSource.DataMember = "Biri_MonitoraggioRifiuti_EXTRATESTERIFIUTI"
        Me.EXTRATESTERIFIUTIBindingSource.DataSource = Me.Biri_MonitoraggioRifiutiBindingSource
        '
        'GiustificativoCerTextBox
        '
        Me.GiustificativoCerTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.EXTRATESTERIFIUTIBindingSource, "GiustificativoCer", True))
        Me.GiustificativoCerTextBox.Location = New System.Drawing.Point(170, 370)
        Me.GiustificativoCerTextBox.Name = "GiustificativoCerTextBox"
        Me.GiustificativoCerTextBox.Size = New System.Drawing.Size(200, 20)
        Me.GiustificativoCerTextBox.TabIndex = 9
        '
        'Arrivo4CopiaCheckBox
        '
        Me.Arrivo4CopiaCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.EXTRATESTERIFIUTIBindingSource, "Arrivo4Copia", True))
        Me.Arrivo4CopiaCheckBox.Location = New System.Drawing.Point(170, 422)
        Me.Arrivo4CopiaCheckBox.Name = "Arrivo4CopiaCheckBox"
        Me.Arrivo4CopiaCheckBox.Size = New System.Drawing.Size(200, 24)
        Me.Arrivo4CopiaCheckBox.TabIndex = 13
        Me.Arrivo4CopiaCheckBox.Text = "CheckBox1"
        Me.Arrivo4CopiaCheckBox.UseVisualStyleBackColor = True
        '
        'NoteTextBox
        '
        Me.NoteTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.EXTRATESTERIFIUTIBindingSource, "Note", True))
        Me.NoteTextBox.Location = New System.Drawing.Point(170, 478)
        Me.NoteTextBox.Multiline = True
        Me.NoteTextBox.Name = "NoteTextBox"
        Me.NoteTextBox.Size = New System.Drawing.Size(200, 72)
        Me.NoteTextBox.TabIndex = 17
        '
        'AllegatiTextBox
        '
        Me.AllegatiTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.EXTRATESTERIFIUTIBindingSource, "Allegati", True))
        Me.AllegatiTextBox.Location = New System.Drawing.Point(170, 556)
        Me.AllegatiTextBox.Name = "AllegatiTextBox"
        Me.AllegatiTextBox.Size = New System.Drawing.Size(200, 20)
        Me.AllegatiTextBox.TabIndex = 23
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(452, 319)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(75, 23)
        Me.Button1.TabIndex = 24
        Me.Button1.Text = "Salva dati"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'BindingNavigator1
        '
        Me.BindingNavigator1.AddNewItem = Nothing
        Me.BindingNavigator1.BindingSource = Me.EXTRATESTERIFIUTIBindingSource
        Me.BindingNavigator1.CountItem = Me.BindingNavigatorCountItem1
        Me.BindingNavigator1.DeleteItem = Me.BindingNavigatorDeleteItem1
        Me.BindingNavigator1.Dock = System.Windows.Forms.DockStyle.None
        Me.BindingNavigator1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem1, Me.BindingNavigatorMovePreviousItem1, Me.BindingNavigatorSeparator3, Me.BindingNavigatorPositionItem1, Me.BindingNavigatorCountItem1, Me.BindingNavigatorSeparator4, Me.BindingNavigatorMoveNextItem1, Me.BindingNavigatorMoveLastItem1, Me.BindingNavigatorSeparator5, Me.BindingNavigatorDeleteItem1, Me.ToolStripButton1})
        Me.BindingNavigator1.Location = New System.Drawing.Point(9, 251)
        Me.BindingNavigator1.MoveFirstItem = Nothing
        Me.BindingNavigator1.MoveLastItem = Nothing
        Me.BindingNavigator1.MoveNextItem = Nothing
        Me.BindingNavigator1.MovePreviousItem = Nothing
        Me.BindingNavigator1.Name = "BindingNavigator1"
        Me.BindingNavigator1.PositionItem = Me.BindingNavigatorPositionItem1
        Me.BindingNavigator1.ShowItemToolTips = False
        Me.BindingNavigator1.Size = New System.Drawing.Size(380, 25)
        Me.BindingNavigator1.TabIndex = 25
        Me.BindingNavigator1.Text = "BindingNavigator1"
        '
        'BindingNavigatorCountItem1
        '
        Me.BindingNavigatorCountItem1.Name = "BindingNavigatorCountItem1"
        Me.BindingNavigatorCountItem1.Size = New System.Drawing.Size(34, 22)
        Me.BindingNavigatorCountItem1.Text = "di {0}"
        Me.BindingNavigatorCountItem1.ToolTipText = "Numero totale di elementi"
        '
        'BindingNavigatorDeleteItem1
        '
        Me.BindingNavigatorDeleteItem1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorDeleteItem1.Image = CType(resources.GetObject("BindingNavigatorDeleteItem1.Image"), System.Drawing.Image)
        Me.BindingNavigatorDeleteItem1.Name = "BindingNavigatorDeleteItem1"
        Me.BindingNavigatorDeleteItem1.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorDeleteItem1.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorDeleteItem1.Text = "Elimina"
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
        'ToolStripButton1
        '
        Me.ToolStripButton1.Image = Global.MonitoraggioRifiuti.My.Resources.Resources.Iconsmind_Outline_Add
        Me.ToolStripButton1.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.ToolStripButton1.Name = "ToolStripButton1"
        Me.ToolStripButton1.Size = New System.Drawing.Size(149, 22)
        Me.ToolStripButton1.Text = "Aggiungi Registrazione"
        '
        'DataFormularioTB
        '
        Me.DataFormularioTB.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.EXTRATESTERIFIUTIBindingSource, "DataArrivoFormulario", True))
        Me.DataFormularioTB.Location = New System.Drawing.Point(170, 452)
        Me.DataFormularioTB.Name = "DataFormularioTB"
        Me.DataFormularioTB.Size = New System.Drawing.Size(200, 20)
        Me.DataFormularioTB.TabIndex = 26
        '
        'DataRitiroTb
        '
        Me.DataRitiroTb.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.EXTRATESTERIFIUTIBindingSource, "DataRitiro", True))
        Me.DataRitiroTb.Location = New System.Drawing.Point(170, 397)
        Me.DataRitiroTb.Name = "DataRitiroTb"
        Me.DataRitiroTb.Size = New System.Drawing.Size(200, 20)
        Me.DataRitiroTb.TabIndex = 27
        '
        'oDTPRitiro
        '
        Me.oDTPRitiro.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.oDTPRitiro.Location = New System.Drawing.Point(398, 397)
        Me.oDTPRitiro.Name = "oDTPRitiro"
        Me.oDTPRitiro.Size = New System.Drawing.Size(200, 20)
        Me.oDTPRitiro.TabIndex = 28
        Me.oDTPRitiro.Visible = False
        '
        'oDTPFormulario
        '
        Me.oDTPFormulario.Location = New System.Drawing.Point(398, 452)
        Me.oDTPFormulario.Name = "oDTPFormulario"
        Me.oDTPFormulario.Size = New System.Drawing.Size(200, 20)
        Me.oDTPFormulario.TabIndex = 29
        Me.oDTPFormulario.Visible = False
        '
        'CodiciCERBindingSource
        '
        Me.CodiciCERBindingSource.DataMember = "Codici_CER"
        Me.CodiciCERBindingSource.DataSource = Me.SicuraDataSet
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
        'Codici_CERTableAdapter
        '
        Me.Codici_CERTableAdapter.ClearBeforeFill = True
        '
        'FKEXTRATESTERIFIUTICodiciCERBindingSource
        '
        Me.FKEXTRATESTERIFIUTICodiciCERBindingSource.DataMember = "FK_EXTRATESTERIFIUTI_Codici_CER"
        Me.FKEXTRATESTERIFIUTICodiciCERBindingSource.DataSource = Me.CodiciCERBindingSource
        '
        'tiporifiuto
        '
        Me.tiporifiuto.DataBindings.Add(New System.Windows.Forms.Binding("SelectedValue", Me.EXTRATESTERIFIUTIBindingSource, "TIPORIFIUTO", True))
        Me.tiporifiuto.DataSource = Me.CodiciCERBindingSource
        Me.tiporifiuto.DisplayMember = "DescrizioneCerEstesa"
        Me.tiporifiuto.FormattingEnabled = True
        Me.tiporifiuto.Location = New System.Drawing.Point(170, 319)
        Me.tiporifiuto.Name = "tiporifiuto"
        Me.tiporifiuto.Size = New System.Drawing.Size(200, 21)
        Me.tiporifiuto.TabIndex = 30
        Me.tiporifiuto.ValueMember = "ID"
        '
        'DataRitiroDateTimePicker
        '
        Me.DataRitiroDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Value", Me.EXTRATESTERIFIUTIBindingSource, "DataRitiro", True))
        Me.DataRitiroDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.EXTRATESTERIFIUTIBindingSource, "DataRitiro", True))
        Me.DataRitiroDateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.DataRitiroDateTimePicker.Location = New System.Drawing.Point(690, 397)
        Me.DataRitiroDateTimePicker.Name = "DataRitiroDateTimePicker"
        Me.DataRitiroDateTimePicker.Size = New System.Drawing.Size(200, 20)
        Me.DataRitiroDateTimePicker.TabIndex = 31
        '
        'DataArrivoFormularioDateTimePicker
        '
        Me.DataArrivoFormularioDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Value", Me.EXTRATESTERIFIUTIBindingSource, "DataArrivoFormulario", True))
        Me.DataArrivoFormularioDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.EXTRATESTERIFIUTIBindingSource, "DataArrivoFormulario", True))
        Me.DataArrivoFormularioDateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.DataArrivoFormularioDateTimePicker.Location = New System.Drawing.Point(736, 456)
        Me.DataArrivoFormularioDateTimePicker.Name = "DataArrivoFormularioDateTimePicker"
        Me.DataArrivoFormularioDateTimePicker.Size = New System.Drawing.Size(200, 20)
        Me.DataArrivoFormularioDateTimePicker.TabIndex = 32
        '
        'Gestione
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1088, 596)
        Me.Controls.Add(DataArrivoFormularioLabel1)
        Me.Controls.Add(Me.DataArrivoFormularioDateTimePicker)
        Me.Controls.Add(DataRitiroLabel1)
        Me.Controls.Add(Me.DataRitiroDateTimePicker)
        Me.Controls.Add(Me.tiporifiuto)
        Me.Controls.Add(Me.oDTPFormulario)
        Me.Controls.Add(Me.oDTPRitiro)
        Me.Controls.Add(Me.DataRitiroTb)
        Me.Controls.Add(Me.DataFormularioTB)
        Me.Controls.Add(Me.BindingNavigator1)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(GiustificativoCerLabel)
        Me.Controls.Add(Me.GiustificativoCerTextBox)
        Me.Controls.Add(DataRitiroLabel)
        Me.Controls.Add(Arrivo4CopiaLabel)
        Me.Controls.Add(Me.Arrivo4CopiaCheckBox)
        Me.Controls.Add(DataArrivoFormularioLabel)
        Me.Controls.Add(NoteLabel)
        Me.Controls.Add(Me.NoteTextBox)
        Me.Controls.Add(AllegatiLabel)
        Me.Controls.Add(Me.AllegatiTextBox)
        Me.Controls.Add(Me.Biri_MonitoraggioRifiutiDataGridView)
        Me.Controls.Add(Me.Biri_MonitoraggioRifiutiBindingNavigator)
        Me.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.EXTRATESTERIFIUTIBindingSource, "TIPORIFIUTO", True))
        Me.DataBindings.Add(New System.Windows.Forms.Binding("Tag", Me.CodiciCERBindingSource, "DescrizioneCerEstesa", True))
        Me.Name = "Gestione"
        Me.Text = "Gestione"
        CType(Me.Biri_MonitoraggioRifiutiBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Biri_MonitoraggioRifiutiBindingNavigator.ResumeLayout(False)
        Me.Biri_MonitoraggioRifiutiBindingNavigator.PerformLayout()
        CType(Me.Biri_MonitoraggioRifiutiBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.SicuraDataSet, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Biri_MonitoraggioRifiutiDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.EXTRATESTERIFIUTIBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BindingNavigator1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.BindingNavigator1.ResumeLayout(False)
        Me.BindingNavigator1.PerformLayout()
        CType(Me.CodiciCERBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.FKEXTRATESTERIFIUTICodiciCERBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents SicuraDataSet As SicuraDataSet
    Friend WithEvents Biri_MonitoraggioRifiutiBindingSource As BindingSource
    Friend WithEvents Biri_MonitoraggioRifiutiTableAdapter As SicuraDataSetTableAdapters.Biri_MonitoraggioRifiutiTableAdapter
    Friend WithEvents TableAdapterManager As SicuraDataSetTableAdapters.TableAdapterManager
    Friend WithEvents Biri_MonitoraggioRifiutiBindingNavigator As BindingNavigator
    Friend WithEvents BindingNavigatorAddNewItem As ToolStripButton
    Friend WithEvents BindingNavigatorCountItem As ToolStripLabel
    Friend WithEvents BindingNavigatorDeleteItem As ToolStripButton
    Friend WithEvents BindingNavigatorMoveFirstItem As ToolStripButton
    Friend WithEvents BindingNavigatorMovePreviousItem As ToolStripButton
    Friend WithEvents BindingNavigatorSeparator As ToolStripSeparator
    Friend WithEvents BindingNavigatorPositionItem As ToolStripTextBox
    Friend WithEvents BindingNavigatorSeparator1 As ToolStripSeparator
    Friend WithEvents BindingNavigatorMoveNextItem As ToolStripButton
    Friend WithEvents BindingNavigatorMoveLastItem As ToolStripButton
    Friend WithEvents BindingNavigatorSeparator2 As ToolStripSeparator
    Friend WithEvents Biri_MonitoraggioRifiutiBindingNavigatorSaveItem As ToolStripButton
    Friend WithEvents Biri_MonitoraggioRifiutiDataGridView As DataGridView
    Friend WithEvents DataGridViewTextBoxColumn1 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn3 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn4 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn5 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn6 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn7 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn8 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn9 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn10 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn11 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn12 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn13 As DataGridViewTextBoxColumn
    Friend WithEvents EXTRATESTERIFIUTITableAdapter As SicuraDataSetTableAdapters.EXTRATESTERIFIUTITableAdapter
    Friend WithEvents EXTRATESTERIFIUTIBindingSource As BindingSource
    Friend WithEvents GiustificativoCerTextBox As TextBox
    Friend WithEvents Arrivo4CopiaCheckBox As CheckBox
    Friend WithEvents NoteTextBox As TextBox
    Friend WithEvents AllegatiTextBox As TextBox
    Friend WithEvents Button1 As Button
    Friend WithEvents BindingNavigator1 As BindingNavigator
    Friend WithEvents BindingNavigatorCountItem1 As ToolStripLabel
    Friend WithEvents BindingNavigatorDeleteItem1 As ToolStripButton
    Friend WithEvents BindingNavigatorMoveFirstItem1 As ToolStripButton
    Friend WithEvents BindingNavigatorMovePreviousItem1 As ToolStripButton
    Friend WithEvents BindingNavigatorSeparator3 As ToolStripSeparator
    Friend WithEvents BindingNavigatorPositionItem1 As ToolStripTextBox
    Friend WithEvents BindingNavigatorSeparator4 As ToolStripSeparator
    Friend WithEvents BindingNavigatorMoveNextItem1 As ToolStripButton
    Friend WithEvents BindingNavigatorMoveLastItem1 As ToolStripButton
    Friend WithEvents BindingNavigatorSeparator5 As ToolStripSeparator
    Friend WithEvents DataFormularioTB As TextBox
    Friend WithEvents DataRitiroTb As TextBox
    Friend WithEvents oDTPRitiro As DateTimePicker
    Friend WithEvents oDTPFormulario As DateTimePicker
    Friend WithEvents CodiciCERBindingSource As BindingSource
    Friend WithEvents Codici_CERTableAdapter As SicuraDataSetTableAdapters.Codici_CERTableAdapter
    Friend WithEvents FKEXTRATESTERIFIUTICodiciCERBindingSource As BindingSource
    Friend WithEvents tiporifiuto As ComboBox
    Friend WithEvents DataRitiroDateTimePicker As DateTimePicker
    Friend WithEvents DataArrivoFormularioDateTimePicker As DateTimePicker
    Friend WithEvents ToolStripButton1 As ToolStripButton
End Class
