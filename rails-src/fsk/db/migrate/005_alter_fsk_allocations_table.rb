class AlterFskAllocationsTable < ActiveRecord::Migration
  def self.up
    rename_column("fsk_allocations", "impactAllotment", "impact_allotment")
    rename_column("fsk_allocations", "forerunnerAllotment", "forerunner_allotment")
    rename_column("fsk_allocations", "regionalAllotment", "regional_allotment")
    rename_column("fsk_allocations", "regionallyRaised", "regionally_raised")
    rename_column("fsk_allocations", "locallyRaised", "locally_raised")
    rename_column("fsk_allocations", "allocationYear", "allocation_year")
    rename_column("fsk_allocations", "nationalNotes", "national_notes")
    rename_column("fsk_allocations", "impactNotes", "impact_notes")
    rename_column("fsk_allocations", "forerunnerNotes", "forerunner_notes")
    rename_column("fsk_allocations", "regionalNotes", "regional_notes")
    rename_column("fsk_allocations", "localNotes", "local_notes")
  end

  def self.down
    rename_column("fsk_allocations", "impact_allotment", "impactAllotment")
    rename_column("fsk_allocations", "forerunner_allotment", "forerunnerAllotment")
    rename_column("fsk_allocations", "regional_allotment", "regionalAllotment")
    rename_column("fsk_allocations", "regionally_raised", "regionallyRaised")
    rename_column("fsk_allocations", "locally_raised", "locallyRaised")
    rename_column("fsk_allocations", "allocation_year", "allocationYear")
    rename_column("fsk_allocations", "national_notes", "nationalNotes")
    rename_column("fsk_allocations", "impact_notes", "impactNotes")
    rename_column("fsk_allocations", "forerunner_notes", "forerunnerNotes")
    rename_column("fsk_allocations", "regional_notes", "regionalNotes")
    rename_column("fsk_allocations", "local_notes", "localNotes")
  end
end
