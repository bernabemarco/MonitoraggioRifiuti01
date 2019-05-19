<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class Main
    Inherits System.Windows.Forms.Form

    'Form esegue l'override del metodo Dispose per pulire l'elenco dei componenti.
    <System.Diagnostics.DebuggerNonUserCode()>
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
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Me.OpenDash = New System.Windows.Forms.Button()
        Me.Esci = New System.Windows.Forms.Button()
        Me.OpenRiep = New System.Windows.Forms.Button()
        Me.SicuraDataSet = New MonitoraggioRifiuti.SicuraDataSet()
        Me.Biri_MonitoraggioRifiutiTableAdapter = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.Biri_MonitoraggioRifiutiTableAdapter()
        Me.TableAdapterManager = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.TableAdapterManager()
        Me.RiepilogoGeneraleDTTableAdapter = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.RiepilogoGeneraleDTTableAdapter()
        Me.Button1 = New System.Windows.Forms.Button()
        CType(Me.SicuraDataSet, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'OpenDash
        '
        Me.OpenDash.Location = New System.Drawing.Point(35, 31)
        Me.OpenDash.Name = "OpenDash"
        Me.OpenDash.Size = New System.Drawing.Size(88, 37)
        Me.OpenDash.TabIndex = 0
        Me.OpenDash.Text = "Apri Form Cruscotto"
        Me.OpenDash.UseVisualStyleBackColor = True
        '
        'Esci
        '
        Me.Esci.Location = New System.Drawing.Point(136, 142)
        Me.Esci.Name = "Esci"
        Me.Esci.Size = New System.Drawing.Size(88, 37)
        Me.Esci.TabIndex = 1
        Me.Esci.Text = "Esci"
        Me.Esci.UseVisualStyleBackColor = True
        '
        'OpenRiep
        '
        Me.OpenRiep.Location = New System.Drawing.Point(238, 31)
        Me.OpenRiep.Name = "OpenRiep"
        Me.OpenRiep.Size = New System.Drawing.Size(88, 37)
        Me.OpenRiep.TabIndex = 2
        Me.OpenRiep.Text = "Apri Riepilogo Attività"
        Me.OpenRiep.UseVisualStyleBackColor = True
        '
        'SicuraDataSet
        '
        Me.SicuraDataSet.DataSetName = "SicuraDataSet"
        Me.SicuraDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'Biri_MonitoraggioRifiutiTableAdapter
        '
        Me.Biri_MonitoraggioRifiutiTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.Codici_CERTableAdapter = Nothing
        Me.TableAdapterManager.Connection = Nothing
        Me.TableAdapterManager.EXTRATESTEDOCTableAdapter = Nothing
        Me.TableAdapterManager.EXTRATESTERIFIUTITableAdapter = Nothing
        Me.TableAdapterManager.RIGHEDOCUMENTITableAdapter = Nothing
        Me.TableAdapterManager.UpdateOrder = MonitoraggioRifiuti.SicuraDataSetTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'RiepilogoGeneraleDTTableAdapter
        '
        Me.RiepilogoGeneraleDTTableAdapter.ClearBeforeFill = True
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(35, 94)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(88, 37)
        Me.Button1.TabIndex = 3
        Me.Button1.Text = "Apri Form Cruscotto"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'Main
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(365, 224)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.OpenRiep)
        Me.Controls.Add(Me.Esci)
        Me.Controls.Add(Me.OpenDash)
        Me.Name = "Main"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Gestione Monitoraggio Rifiuti"
        CType(Me.SicuraDataSet, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents OpenDash As Button
    Friend WithEvents Esci As Button
    Friend WithEvents OpenRiep As Button
    Friend WithEvents SicuraDataSet As SicuraDataSet
    Friend WithEvents Biri_MonitoraggioRifiutiTableAdapter As SicuraDataSetTableAdapters.Biri_MonitoraggioRifiutiTableAdapter
    Friend WithEvents TableAdapterManager As SicuraDataSetTableAdapters.TableAdapterManager
    Friend WithEvents RiepilogoGeneraleDTTableAdapter As SicuraDataSetTableAdapters.RiepilogoGeneraleDTTableAdapter
    Friend WithEvents Button1 As Button
End Class
